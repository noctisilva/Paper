//
//  BookCoverImage.swift
//  Albert_iOSChallenge
//
//  Created by Tae Hong Min on 7/10/19.
//  Copyright © 2019 taehongmin. All rights reserved.
//

import Foundation
import UIKit

class BookCoverImage: UIImageView {
    
    //Getting the Medium sized image
    func getPayload(str : String) {
        let session = URLSession.shared
        let url = URL(string: "http://covers.openlibrary.org/b/isbn/\(str)-M.jpg")!
        let task = session
        task.invalidateAndCancel()
        let taskSession = task.dataTask(with: url) { data, response, error in
            
            if error != nil || data == nil {
                print("Error: \(error)")
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                print("Server error!")
                return
            }
            do {
                if let image = UIImage(data: data!) {
                    DispatchQueue.main.async {
                        self.image = image
                    }
                }
            } catch {
                print("JSON error: \(error.localizedDescription)")
                
            }
        }
        
        taskSession.resume()
    }
    
}

class LargeBookCoverImage: UIImageView {
    
    //Getting the large sized image
    func getPayload(str : String) {
        let session = URLSession.shared
        let url = URL(string: "http://covers.openlibrary.org/b/isbn/\(str)-L.jpg")!
        let task = session
        task.invalidateAndCancel()
        let taskSession = task.dataTask(with: url) { data, response, error in
            
            if error != nil || data == nil {
                print("Error: \(error)")
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                print("Server error!")
                return
            }
            do {
                if let image = UIImage(data: data!) {
                    DispatchQueue.main.async {
                        self.image = image
                    }
                }
            } catch {
                print("JSON error: \(error.localizedDescription)")
                
            }
        }
        
        taskSession.resume()
    }
    
}
