//
//  WishlistViewController.swift
//  Albert_iOSChallenge
//
//  Created by Tae Hong Min on 7/10/19.
//  Copyright © 2019 taehongmin. All rights reserved.
//

//Similar comments from the PaperViewController


import UIKit
import RealmSwift

class WishlistViewController: UIViewController {

    let paperObjects = PaperObejcts()
    let wishlistCellId = "WishListCell"
    
    var rc : UIRefreshControl = {
        let rc = UIRefreshControl()
        rc.tintColor = .black
        rc.addTarget(self, action: #selector(readRefresh), for: .valueChanged)
        return rc
    }()
    
    var books : [Book] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        [paperObjects.paperContainer, paperObjects.paperTopView, paperObjects.wishListLabel, paperObjects.paperTableView].forEach(self.view.addSubview)
        [paperObjects.topPaperLabel].forEach(paperObjects.paperTopView.addSubview)
        
        
        
        setupDelegates{
            self.read()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        paperObjects.wishListLabel.text = "Your Wishlist"
        navigationController?.navigationBar.alpha = 0.0
        self.read()
    }
    
    func setupDelegates(_ completion : @escaping ()->()){
        paperObjects.paperTableView.delegate = self
        paperObjects.paperTableView.dataSource = self
        paperObjects.paperTableView.register(WishListCell.self, forCellReuseIdentifier: wishlistCellId)
    }
    
    override func viewDidLayoutSubviews() {
        
        self.view.backgroundColor = .white
        navigationController?.navigationBar.alpha = 0.0
        
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
        
        if #available(iOS 11, *) {
            let guide = view.safeAreaLayoutGuide
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
            paperObjects.wishListLabel.widthAnchor.constraint(equalToConstant: self.view.bounds.width),
            paperObjects.wishListLabel.heightAnchor.constraint(equalToConstant: 40),
            paperObjects.wishListLabel.centerXAnchor.constraint(equalTo: paperObjects.paperContainer.centerXAnchor),
            paperObjects.wishListLabel.topAnchor.constraint(equalTo: paperObjects.paperTopView.bottomAnchor)
        
            ])
        NSLayoutConstraint.activate([
            paperObjects.paperTableView.widthAnchor.constraint(equalTo: paperObjects.paperTopView.widthAnchor),
            paperObjects.paperTableView.heightAnchor.constraint(equalToConstant: self.view.bounds.height * 0.8),
            paperObjects.paperTableView.centerXAnchor.constraint(equalTo: paperObjects.paperContainer.centerXAnchor),
            paperObjects.paperTableView.topAnchor.constraint(equalTo: paperObjects.wishListLabel.bottomAnchor)
        ])
        
        if #available(iOS 10.0, *) {
            self.paperObjects.paperTableView.refreshControl = rc
        } else {
            self.paperObjects.paperTableView.addSubview(rc)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @objc private func deleteFromWishList(_ sender: UITapGestureRecognizer) {
        guard let index = sender.view?.tag else { return }
        sender.view?.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       usingSpringWithDamping: 0.2,
                       initialSpringVelocity: 4.0,
                       options: .allowUserInteraction,
                       animations: { [weak self] in
                        sender.view?.transform = .identity
            },
                       completion: nil)
        
        let alertConf = UIAlertController(title: "Are you sure you want to remove from wishlist?", message: nil, preferredStyle: .alert)
        alertConf.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: { (action) in
            self.delete(index: index)
        }))
        alertConf.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        self.present(alertConf, animated: true, completion: nil)
        
    }
    
    func delete(index: Int){
        let id = "\(books[index].title ?? "")\(books[index].isbn?.first ?? "")"
        let realm = try! Realm()
        guard let objects = realm.objects(BookDBO.self).filter("id = \"\(id)\" ").first else { return  }
        try! realm.write {
            realm.delete(objects)
            paperObjects.wishListLabel.text = "Deleted!"
            read()
        }
    }
    
    @objc private func readRefresh() {
        read()
    }
    
    func read(){
        let realm = try! Realm()
        do {
            let repo = try realm.objects(BookDBO.self).map { try $0.toBook() }
            books = repo
            paperObjects.paperTableView.reloadData()
            self.rc.endRefreshing()
        }catch let e {
            print("error: \(e.localizedDescription)")
        }
    }
}
extension WishlistViewController: UITextFieldDelegate, UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: wishlistCellId, for: indexPath) as! WishListCell
        cell.bcm.wishListButton.tag = indexPath.row
        cell.bcm.wishListButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(deleteFromWishList)))
        cell.bookObject = books[indexPath.item]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65.0
    }
}


