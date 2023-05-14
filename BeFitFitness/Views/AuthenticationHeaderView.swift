//
//  AuthenticationHeaderView.swift
//  BeFitFitness
//
//  Created by Pubudidev on 5/14/23.
//

import UIKit

// Creating reusable complex UIView components
class AuthenticationHeaderView: UIView {
    
    // To add an image into UIView
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(named: "fitnessicon")
        imageView.tintColor = .white
        imageView.layer.cornerRadius = 12 // to curve the corners
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.text = "titleLabel"
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.text = "subTitleLabel"
        return label
    }()
    
    // To create an instance from AuthenticationHeaderView
    init(title: String, subTitle: String)  {
        super.init(frame: .zero)
        self.titleLabel.text = title
        self.subTitleLabel.text = subTitle
        
        self.setUpUI()
    }
    
    // T o handle any other errors
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI(){
        // in this case this self mean the view
        self.addSubview(imageView)
        self.addSubview(titleLabel)
        self.addSubview(subTitleLabel)
        
        // If we want to add our own constraints set this to false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // Set topAnchor of the image view. 16 points bellow the layoutMarginsGuide
            self.imageView.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: 16),
            // Aligning the image view to the center
            self.imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            // Set width to 90 points
            self.imageView.widthAnchor.constraint(equalToConstant: 90),
            // Set height simillar to the width
            self.imageView.heightAnchor.constraint(equalTo: self.imageView.widthAnchor),
            
            // Place the title label 19 points bellow from bottomAnchor of imageview
            self.titleLabel.topAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: 19),
            // Take the main view's leadingAnchor as titleLabel's leadingAnchor
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            // Take the main view's trailingAnchor as titleLabel's trailingAnchor
            self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            self.subTitleLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 12),
            self.subTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.subTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}
