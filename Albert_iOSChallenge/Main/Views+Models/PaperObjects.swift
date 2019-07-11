//
//  PaperObjects.swift
//  Albert_iOSChallenge
//
//  Created by Tae Hong Min on 7/9/19.
//  Copyright © 2019 taehongmin. All rights reserved.
//

import UIKit

class PaperObejcts: NSObject{
    
    //Camera view container
    var paperContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var paperTopView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var topPaperLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font =  UIFont(name: "AppleSDGothicNeo-SemiBold", size: 40)
        label.text = "Paper"
        label.textColor = .black
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.alpha = 1.0
        return label
    }()
    
    var descriptionPaperLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font =  UIFont(name: "AppleSDGothicNeo-SemiBold", size: 12)
        label.text = "Search for title of a book!"
        label.textColor = UIColor(rgb: 0x2d3561)
        label.backgroundColor = .clear
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.alpha = 1.0
        
        return label
    }()
    
    var paperSearchContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var paperSearch: UITextView = {
        let textview = UITextView()
        textview.translatesAutoresizingMaskIntoConstraints = false
        textview.textAlignment = .left
        textview.textColor = .black
        textview.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 20)
        
        textview.isUserInteractionEnabled = true
        textview.textContainer.maximumNumberOfLines = 1
        textview.returnKeyType = .search
        return textview
    }()
    
    var wishListLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font =  UIFont(name: "AppleSDGothicNeo-Bold", size: 20)
        label.text = "Your Wishlist"
        label.textColor = .white
        label.textAlignment = .center
        label.backgroundColor = UIColor(rgb: 0xdf7599)
        return label
    }()
    
    var paperTableView: UITableView = {
        let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.isScrollEnabled = true
        tableview.alwaysBounceVertical = true
        tableview.clipsToBounds = true
        tableview.separatorStyle = .none
        tableview.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        return tableview
    }()
    
    var paperImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.alpha = 1.0
        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true
        return imageView
    }()
    
    var paperLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font =  UIFont(name: "AppleSDGothicNeo-SemiBold", size: 16)
        label.textColor = .white
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.alpha = 1.0
        return label
    }()
    
    var title: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 2
        button.clipsToBounds = true
        button.isEnabled = true
        button.layer.masksToBounds = true
        button.backgroundColor = UIColor(rgb: 0x7189bf)
        button.setTitle("Title", for: .normal)
        button.titleLabel?.font =  UIFont(name: "AppleSDGothicNeo-SemiBold", size: 12)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        return button
    }()
    
    var author: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 2
        button.clipsToBounds = true
        button.isEnabled = true
        button.layer.masksToBounds = true
        button.backgroundColor = UIColor(rgb: 0xffc785)
        button.setTitle("Author", for: .normal)
        button.titleLabel?.font =  UIFont(name: "AppleSDGothicNeo-Bold", size: 12)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        return button
    }()
}
