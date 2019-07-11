//
//  DetailedViewObjects.swift
//  Albert_iOSChallenge
//
//  Created by Tae Hong Min on 7/11/19.
//  Copyright © 2019 taehongmin. All rights reserved.
//

import UIKit

class DetailedViewObjects: NSObject{
    
    //Camera view container
    var imgView: LargeBookCoverImage = {
        let imageView = LargeBookCoverImage()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "placeholder")

        return imageView
    }()
    
    var title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font =  UIFont(name: "AppleSDGothicNeo-Bold", size: 30)
        label.text = "Lord of the Rings"
        label.textColor = .white
        label.textAlignment = .right
        label.adjustsFontSizeToFitWidth = true
        label.alpha = 1.0
        label.lineBreakMode =  .byWordWrapping
        label.numberOfLines  = 2
        return label
    }()

    var Details: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var svContentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var author: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font =  UIFont(name: "AppleSDGothicNeo-Bold", size: 20)
        label.text = "Tae Hong Min"
        label.textColor = .black
        label.textAlignment = .left
        label.lineBreakMode =  .byWordWrapping
        label.numberOfLines  = 2
        return label
    }()
    
    var subjects: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font =  UIFont(name: "AppleSDGothicNeo-SemiBold", size: 16)
        label.textColor = .black
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.alpha = 1.0
        label.lineBreakMode =  .byWordWrapping
        label.numberOfLines  = 2
        return label
    }()
    
    var publishers: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font =  UIFont(name: "AppleSDGothicNeo-SemiBold", size: 16)
        label.textColor = .black
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.alpha = 1.0
        label.lineBreakMode =  .byWordWrapping
        label.numberOfLines  = 2
        return label
    }()
    
    var language: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font =  UIFont(name: "AppleSDGothicNeo-SemiBold", size: 16)
        label.textColor = .black
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.alpha = 1.0
        label.lineBreakMode =  .byWordWrapping
        label.numberOfLines  = 2
        return label
    }()
    
    var year: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font =  UIFont(name: "AppleSDGothicNeo-SemiBold", size: 16)
        label.textColor = .black
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.alpha = 1.0
        label.lineBreakMode =  .byWordWrapping
        label.numberOfLines  = 2
        return label
    }()
    
    var paperButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 25
        button.clipsToBounds = true
        button.isEnabled = true
        button.layer.masksToBounds = true
        button.backgroundColor = UIColor(rgb: 0x7189bf)
        button.setTitle("Search", for: .normal)
        button.titleLabel?.font =  UIFont(name: "AppleSDGothicNeo-SemiBold", size: 15)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        return button
    }()
    
    var bookmarkButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 3
        button.clipsToBounds = true
        button.isEnabled = true
        button.layer.masksToBounds = true
        button.backgroundColor = UIColor(rgb: 0x2d3561)
        button.setTitle("Wishlist+", for: .normal)
        button.titleLabel?.font =  UIFont(name: "AppleSDGothicNeo-Bold", size: 16)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.titleEdgeInsets = UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
        return button
    }()
}
