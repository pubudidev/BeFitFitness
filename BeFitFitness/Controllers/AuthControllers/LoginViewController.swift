//
//  LoginViewController.swift
//  BeFitFitness
//
//  Created by Pubudidev on 5/12/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let authHeaderView = AuthenticationHeaderView(title: "Sign In", subTitle: "Sign into Your Account")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground // colour will change based on light/dark mode
        // If navigation bar is visible, hide it
        self.navigationController?.navigationBar.isHidden = true
        self.setUpUI()
        
    }
    
    func setUpUI(){
        self.view.addSubview(authHeaderView)
        
        authHeaderView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.authHeaderView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.authHeaderView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.authHeaderView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.authHeaderView.heightAnchor.constraint(equalToConstant: 270)
        ])
        
        
    }
}
