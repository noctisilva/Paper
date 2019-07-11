//
//  bookCellModel.swift
//  Albert_iOSChallenge
//
//  Created by Tae Hong Min on 7/9/19.
//  Copyright © 2019 taehongmin. All rights reserved.
//

import UIKit

class BookCellObjects: NSObject{
    
    //Camera view container
    var cellContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 7
        view.clipsToBounds = true
        view.backgroundColor = .white
        return view
    }()
    
    var mainTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font =  UIFont(name: "AppleSDGothicNeo-Bold", size: 14)
        label.text = "Lord of the Rings"
        label.textColor = .black
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.alpha = 1.0
        label.lineBreakMode =  .byWordWrapping
        label.numberOfLines  = 2
        return label
    }()
    
    var author: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font =  UIFont(name: "AppleSDGothicNeo-SemiBold", size: 14)
        label.textColor = .orange
        label.textAlignment = .left 
        label.adjustsFontSizeToFitWidth = true
        label.alpha = 1.0
        label.text = "J.R. Tolkien"
        return label
    }()
    
    var year: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font =  UIFont(name: "AppleSDGothicNeo-SemiBold", size: 12)
        label.textColor = .gray
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.alpha = 1.0
        label.text = "1995"
        return label
    }()
    

    var wishListButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.isEnabled = true
        button.layer.masksToBounds = true
        button.setTitle("Wishlist+", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.backgroundColor = .purple
        button.clipsToBounds = true
        button.layer.cornerRadius = 4
        button.titleLabel?.font =  UIFont(name: "AppleSDGothicNeo-Bold", size: 14.5)
        return button
    }()
    
    var bookImg: BookCoverImage = {
        let imageView = BookCoverImage()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.alpha = 1.0
        imageView.layer.cornerRadius = 3
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "placeholder")
        return imageView
    }()
}
