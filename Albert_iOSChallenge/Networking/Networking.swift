//
//  Networking.swift
//  Albert_iOSChallenge
//
//  Created by Tae Hong Min on 7/9/19.
//  Copyright © 2019 taehongmin. All rights reserved.
//
//Network Objects

import Foundation
import Network
import SwiftyJSON

class Network: NSObject {
    
    static let fService = Network()
    
    //Used to get the payload
    func getPayload(type: String = "title", str : String, completion: @escaping ([Book]) -> ()) {
        let session = URLSession.shared
        let url = URL(string: "http://openlibrary.org/search.json?\(type)=\(str)")!
        let task = session
        task.invalidateAndCancel()
        
        //Realized here I should have found some way to keep track of all the URLSessions so it doesn't
        //crash the app if the requests are too overwheleming to the server
        let taskSession = task.dataTask(with: url) { data, response, error in
            
            if error != nil || data == nil {
                print("Error: \(error)")
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                print("Server error!")
                return
            }
            
            guard let mime = response.mimeType, mime == "text/plain" else {
                print("Wrong MIME type!")
                return
            }
            
            do {
                
                let rJson = try JSON(data: data!).dictionaryObject
                guard let responseData = rJson?["docs"] as? [[String: Any]] else { return }
                
                let jsonData = try JSONSerialization.data(withJSONObject: responseData, options: [])
                let output = try! JSONDecoder().decode([Book].self, from: jsonData)
                DispatchQueue.main.async {
                    completion(output)
                }
            } catch {
                print("JSON error: \(error.localizedDescription)")
                
            }
        }
        
        taskSession.resume()
    }

}
