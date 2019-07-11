//
//  ViewController.swift
//  Albert_iOSChallenge
//
//  Created by Tae Hong Min on 7/9/19.
//  Copyright © 2019 taehongmin. All rights reserved.
//

import UIKit
import RealmSwift

class PaperViewController: UIViewController {

    let paperObjects = PaperObejcts()
    let cellId = "bookCell"

    var userInput:String = ""
    var books : [Book] = []
    var switchmark : String = "title"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        [paperObjects.paperContainer, paperObjects.paperTopView,paperObjects.paperSearchContainer,paperObjects.descriptionPaperLabel, paperObjects.paperTableView].forEach(self.view.addSubview)
        [paperObjects.topPaperLabel,paperObjects.title,paperObjects.author].forEach(paperObjects.paperTopView.addSubview)
        [paperObjects.paperSearch].forEach(paperObjects.paperSearchContainer.addSubview)
        
        paperObjects.paperSearch.delegate = self
        paperObjects.paperSearch.becomeFirstResponder()
        

        setupDelegates{
            self.paperObjects.paperTableView.reloadData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        navigationController?.navigationBar.alpha = 0.0
        paperObjects.descriptionPaperLabel.text = "Search for title of a book!"
        paperObjects.paperSearch.becomeFirstResponder()
    }
    
    func setupDelegates(_ completion : @escaping ()->()){
        paperObjects.paperTableView.delegate = self
        paperObjects.paperTableView.dataSource = self
        paperObjects.paperTableView.register(BookCell.self, forCellReuseIdentifier: cellId)
    }
    
    override func viewDidLayoutSubviews() {
        
        self.view.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            paperObjects.paperContainer.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            paperObjects.paperContainer.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),
            paperObjects.paperContainer.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            paperObjects.paperContainer.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
        NSLayoutConstraint.activate([
            paperObjects.paperTopView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            paperObjects.paperTopView.heightAnchor.constraint(equalToConstant: 150),
            paperObjects.paperTopView.centerXAnchor.constraint(equalTo: paperObjects.paperContainer.centerXAnchor),
            paperObjects.paperTopView.topAnchor.constraint(equalTo: paperObjects.paperContainer.topAnchor)
        ])

        //Check to see if it has the notch
        if #available(iOS 11, *) {
            NSLayoutConstraint.activate([
                paperObjects.topPaperLabel.centerXAnchor.constraint(equalTo: paperObjects.paperTopView.centerXAnchor),
                paperObjects.topPaperLabel.centerYAnchor.constraint(equalTo: paperObjects.paperTopView.centerYAnchor, constant: 15)
            ])
        } else {
            NSLayoutConstraint.activate([
                paperObjects.topPaperLabel.centerXAnchor.constraint(equalTo: paperObjects.paperTopView.centerXAnchor),
                paperObjects.topPaperLabel.centerYAnchor.constraint(equalTo: paperObjects.paperTopView.centerYAnchor)
            ])
        }
        
        NSLayoutConstraint.activate([
            paperObjects.title.widthAnchor.constraint(equalToConstant: 50),
            paperObjects.title.heightAnchor.constraint(equalToConstant: 20),
            paperObjects.title.leftAnchor.constraint(equalTo: paperObjects.paperTopView.leftAnchor, constant: 20),
            paperObjects.title.bottomAnchor.constraint(equalTo: paperObjects.paperTopView.bottomAnchor, constant: -10)
        ])
        NSLayoutConstraint.activate([
            paperObjects.author.widthAnchor.constraint(equalToConstant: 50),
            paperObjects.author.heightAnchor.constraint(equalToConstant: 20),
            paperObjects.author.leftAnchor.constraint(equalTo: paperObjects.title.rightAnchor, constant: 12),
            paperObjects.author.bottomAnchor.constraint(equalTo: paperObjects.paperTopView.bottomAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            paperObjects.paperSearchContainer.widthAnchor.constraint(equalToConstant: self.view.bounds.width),
            paperObjects.paperSearchContainer.heightAnchor.constraint(equalToConstant: 40),
            paperObjects.paperSearchContainer.centerXAnchor.constraint(equalTo: paperObjects.paperContainer.centerXAnchor),
            paperObjects.paperSearchContainer.topAnchor.constraint(equalTo: paperObjects.paperTopView.bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            paperObjects.paperSearch.widthAnchor.constraint(equalToConstant: self.view.bounds.width * 0.9),
            paperObjects.paperSearch.heightAnchor.constraint(equalToConstant: 40),
            paperObjects.paperSearch.centerXAnchor.constraint(equalTo: paperObjects.paperSearchContainer.centerXAnchor),
            paperObjects.paperSearch.centerYAnchor.constraint(equalTo: paperObjects.paperSearchContainer.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            paperObjects.descriptionPaperLabel.widthAnchor.constraint(equalToConstant: self.view.bounds.width),
            paperObjects.descriptionPaperLabel.heightAnchor.constraint(equalToConstant: 20),
            paperObjects.descriptionPaperLabel.leftAnchor.constraint(equalTo: paperObjects.paperSearch.leftAnchor, constant: 5),
            paperObjects.descriptionPaperLabel.topAnchor.constraint(equalTo: paperObjects.paperSearchContainer.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            paperObjects.paperTableView.widthAnchor.constraint(equalTo: paperObjects.paperTopView.widthAnchor),
            paperObjects.paperTableView.heightAnchor.constraint(equalToConstant: self.view.bounds.height * 0.8),
            paperObjects.paperTableView.centerXAnchor.constraint(equalTo: paperObjects.paperContainer.centerXAnchor),
            paperObjects.paperTableView.topAnchor.constraint(equalTo: paperObjects.descriptionPaperLabel.bottomAnchor)
        ])
        
        paperObjects.paperSearch.textInputView.addBorders(edges: .bottom, color: UIColor(rgb: 0x1F1F1F), width: 2)
        paperObjects.title.addTarget(self, action: #selector(titleSearch), for: .touchUpInside)
        paperObjects.author.addTarget(self, action: #selector(authorSearch), for: .touchUpInside)
    }

    @objc private func titleSearch() {
        switchmark = "title"
        paperObjects.descriptionPaperLabel.text = "Search for title of a book!"
    }
    
    @objc private func authorSearch() {
        switchmark = "author"
        paperObjects.descriptionPaperLabel.text = "Search for an Author"
    }
    
    @objc private func searchButtonAction() {
        paperObjects.paperSearchContainer.alpha = 1.0
        paperObjects.wishListLabel.alpha = 0.0
        paperObjects.paperSearch.becomeFirstResponder()
        books.removeAll()
        self.paperObjects.paperTableView.reloadData()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //This is just the animation with a bug :( 
    @objc private func addToWishlist(_ sender: UITapGestureRecognizer) {

        guard let index = sender.view?.tag else { return }
        //writes persitence data to realm
        let realm = try! Realm()
        try! realm.write {
            _ = BookDBO.from(book: books[index], realm: realm)
            paperObjects.paperTableView.reloadData()
            paperObjects.descriptionPaperLabel.text = "Added to Wishlist!"
        }
    }

    func deleteAll(){
        //No migrations needed for this app so I'm using this just in case
        let realm = try! Realm()
        try! realm.write {
            realm.deleteAll()
        }
    }
    
    
}
extension PaperViewController: UITextFieldDelegate, UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! BookCell
        cell.bcm.wishListButton.tag = indexPath.row
        cell.bcm.wishListButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(addToWishlist)))
        cell.bookObject = books[indexPath.item]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.navigationController?.pushViewController(DetailedViewController(books:  books[indexPath.item]), animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65.0
    }
}

extension PaperViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        if(textView.text != "") {
            let newString = textView.text.replacingOccurrences(of: " ", with: "+", options: .literal, range: nil)
            Network.fService.getPayload(type: switchmark, str: newString){ (payload: [Book]) in
                self.books = payload
                self.paperObjects.paperTableView.reloadData()
            }
        }else {
            self.books.removeAll()
            self.paperObjects.paperTableView.reloadData()
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" { // Recognizes search/enter key in keyboard
            
            let newString = textView.text.replacingOccurrences(of: " ", with: "+", options: .literal, range: nil)
            Network.fService.getPayload(type: switchmark, str: newString){ (payload: [Book]) in
                self.books = payload
                self.paperObjects.paperTableView.reloadData()
            }
            textView.resignFirstResponder()
            return false
        }
        return true
    }
}


extension PaperViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
