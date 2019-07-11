//
//  File.swift
//  Albert_iOSChallenge
//
//  Created by Tae Hong Min on 7/11/19.
//  Copyright © 2019 taehongmin. All rights reserved.
//

import UIKit
import RealmSwift

class DetailedViewController: UIViewController, UIScrollViewDelegate {
    
    let dvo = DetailedViewObjects()
    
    var scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.isScrollEnabled = true
        sv.alwaysBounceVertical = true
        return sv
    }()
    
    var books : Book
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Hacky way to add subviews. I would have found a way to iterate though or use a viewmodel
        //given more time =]
        self.view.addSubview(scrollView)
        scrollView.addSubview(dvo.svContentView)
        dvo.svContentView.addSubview(dvo.imgView)
        dvo.svContentView.addSubview(dvo.bookmarkButton)
        dvo.svContentView.addSubview(dvo.title)
        
        self.scrollView.delegate = self
        
        dvo.svContentView.addSubview(dvo.Details)
        dvo.Details.addSubview(dvo.author)
        dvo.Details.addSubview(dvo.year)
        dvo.Details.addSubview(dvo.subjects)
        dvo.Details.addSubview(dvo.publishers)
        dvo.Details.addSubview(dvo.language)
        
        
        navigationController?.navigationBar.alpha = 0.0
        dvo.bookmarkButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(addToWishlist)))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.navigationBar.alpha = 0.0
    }
    
    init(books: Book) {
        self.books = books
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLayoutSubviews() {
        
        self.view.backgroundColor = .white
        
        //NS Constraints!!!
        NSLayoutConstraint.activate([
            scrollView.widthAnchor.constraint(equalToConstant: self.view.bounds.width),
            scrollView.heightAnchor.constraint(equalToConstant: self.view.bounds.height),
            scrollView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            scrollView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            dvo.svContentView.widthAnchor.constraint(equalToConstant: self.view.bounds.width),
            dvo.svContentView.heightAnchor.constraint(equalToConstant: self.view.bounds.height),
            dvo.svContentView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            dvo.svContentView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            dvo.imgView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor),
            dvo.imgView.heightAnchor.constraint(equalToConstant: self.view.bounds.height * 0.45),
            dvo.imgView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            dvo.imgView.topAnchor.constraint(equalTo: self.view.topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            dvo.title.widthAnchor.constraint(equalToConstant: self.view.bounds.width * 0.9),
            dvo.title.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            dvo.title.bottomAnchor.constraint(equalTo:  dvo.imgView.bottomAnchor, constant: -15)
        ])

        NSLayoutConstraint.activate([
            dvo.bookmarkButton.widthAnchor.constraint(equalToConstant: 90),
            dvo.bookmarkButton.heightAnchor.constraint(equalToConstant: 30),
            dvo.bookmarkButton.rightAnchor.constraint(equalTo:  dvo.title.rightAnchor),
            dvo.bookmarkButton.bottomAnchor.constraint(equalTo:  dvo.title.topAnchor, constant: -20)
        ])

        NSLayoutConstraint.activate([
            dvo.Details.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            dvo.Details.heightAnchor.constraint(equalToConstant: 500),
            dvo.Details.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            dvo.Details.topAnchor.constraint(equalTo:  dvo.imgView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            dvo.author.widthAnchor.constraint(equalToConstant: self.view.bounds.width * 0.9),
            dvo.author.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 10),
            dvo.author.topAnchor.constraint(equalTo:  dvo.Details.topAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            dvo.year.widthAnchor.constraint(equalToConstant: self.view.bounds.width * 0.9),
            dvo.year.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 10),
            dvo.year.topAnchor.constraint(equalTo:  dvo.author.bottomAnchor, constant: 10)
        ])
        NSLayoutConstraint.activate([
            dvo.subjects.widthAnchor.constraint(equalToConstant: self.view.bounds.width * 0.9),
            dvo.subjects.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 10),
            dvo.subjects.topAnchor.constraint(equalTo:  dvo.year.bottomAnchor, constant: 10)
            ])
        NSLayoutConstraint.activate([
            dvo.publishers.widthAnchor.constraint(equalToConstant: self.view.bounds.width * 0.9),
            dvo.publishers.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 10),
            dvo.publishers.topAnchor.constraint(equalTo:  dvo.subjects.bottomAnchor, constant: 10)
            ])
        NSLayoutConstraint.activate([
            dvo.language.widthAnchor.constraint(equalToConstant: self.view.bounds.width * 0.9),
            dvo.language.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 10),
            dvo.language.topAnchor.constraint(equalTo:  dvo.publishers.bottomAnchor, constant: 10)
            ])

        //let's make this a bit pretty
        let gradient = CAGradientLayer()
        gradient.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height * 0.7)
        gradient.locations = [0.4, 1.0]
        gradient.colors = [UIColor.clear.cgColor,  UIColor.black.cgColor]
        dvo.imgView.layer.insertSublayer(gradient, at: 0)
        
        setupValues()
    }
    
    @objc private func addToWishlist(_ sender: UITapGestureRecognizer) {
        
        //Let's add some bounce!
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
        
        write()
    }
    
    func write(){
        let realm = try! Realm()
        try! realm.write {
            _ = BookDBO.from(book: books, realm: realm)
        }
    }
    
    func setupValues(){
        
        //Populating values
        dvo.imgView.getPayload(str: books.isbn?.first ?? "")
        dvo.title.text = books.title
        dvo.author.text = "Author: \(String(describing: books.author_name?.joined(separator: ",") ?? ""))"
        dvo.subjects.text = "Subjects: \(String(describing: books.subject?.joined(separator: ",") ?? ""))"
        dvo.publishers.text = "Publisher: \(String(describing: books.publisher?.joined(separator: ",") ?? ""))"
        dvo.language.text = "Language: \(String(describing: books.language?.joined(separator: ",") ?? ""))"
        dvo.year.text = "Year: \(String(books.first_publish_year ?? 0))"
        
    }
    
}

extension DetailedViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
