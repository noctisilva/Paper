//
//  bookCell.swift
//  Albert_iOSChallenge
//
//  Created by Tae Hong Min on 7/9/19.
//  Copyright © 2019 taehongmin. All rights reserved.
//
// Custom Cell for the search tab tableview

import UIKit


class BookCell: UITableViewCell {
    var bcm: BookCellObjects = BookCellObjects()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var bookObject: Book? {
        didSet {
            bcm.mainTitle.text = "\(bookObject?.title ?? "Unknown Title")"
            bcm.author.text = "\(bookObject?.author_name?.first ?? "Unknown Author")"
            bcm.year.text = "\(String(describing: bookObject?.first_publish_year ?? 0))"
            bcm.bookImg.getPayload(str: bookObject?.isbn?.first ?? "")
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let shadowPathSearchContainer = UIBezierPath(rect: bcm.cellContainer.bounds)
        bcm.cellContainer.layer.masksToBounds = false
        bcm.cellContainer.layer.shadowColor = UIColor.black.cgColor
        bcm.cellContainer.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        bcm.cellContainer.layer.shadowOpacity = 0.1
        bcm.cellContainer.layer.shadowRadius = 3
        bcm.cellContainer.layer.shadowPath = shadowPathSearchContainer.cgPath
        bcm.cellContainer.clipsToBounds = false
        
        selectionStyle = .none
    }
    
    func setupViews(){
        
        addSubview(bcm.cellContainer)
        bcm.cellContainer.addSubview(bcm.bookImg)
        bcm.cellContainer.addSubview(bcm.mainTitle)
        bcm.cellContainer.addSubview(bcm.author)
        bcm.cellContainer.addSubview(bcm.year)
        bcm.cellContainer.addSubview(bcm.wishListButton)
        
        NSLayoutConstraint.activate([
            bcm.cellContainer.widthAnchor.constraint(equalToConstant: bounds.width),
            bcm.cellContainer.heightAnchor.constraint(equalToConstant: 55),
            bcm.cellContainer.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            bcm.cellContainer.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            bcm.bookImg.widthAnchor.constraint(equalToConstant: 70),
            bcm.bookImg.heightAnchor.constraint(equalTo: bcm.cellContainer.heightAnchor),
            bcm.bookImg.leftAnchor.constraint(equalTo: bcm.cellContainer.leftAnchor),
            bcm.bookImg.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            bcm.mainTitle.leftAnchor.constraint(equalTo: bcm.bookImg.rightAnchor, constant: 5),
            bcm.mainTitle.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -100),
            bcm.mainTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 7)
        ])
        
        NSLayoutConstraint.activate([
            bcm.author.leftAnchor.constraint(equalTo: bcm.bookImg.rightAnchor, constant: 5),
            
            bcm.author.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5)
        ])
        
        NSLayoutConstraint.activate([
            bcm.year.centerYAnchor.constraint(equalTo: bcm.author.centerYAnchor),
            bcm.year.leftAnchor.constraint(equalTo: bcm.author.rightAnchor, constant: 5)
        ])
        
        NSLayoutConstraint.activate([
            bcm.wishListButton.widthAnchor.constraint(equalToConstant: 70),
            bcm.wishListButton.heightAnchor.constraint(equalToConstant: 25),
            bcm.wishListButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            bcm.wishListButton.rightAnchor.constraint(equalTo: bcm.cellContainer.rightAnchor, constant: -10)
        ])

        
    }
}
