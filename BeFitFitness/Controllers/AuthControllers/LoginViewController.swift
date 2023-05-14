//
//  LoginViewController.swift
//  BeFitFitness
//
//  Created by Pubudidev on 5/12/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let authHeaderView = AuthenticationHeaderView(title: "Sign In", subTitle: "Sign into Your Account")
    
    private let usernameField = PrimaryTextField(fieldType: .username)
    private let passwordField = PrimaryTextField(fieldType: .password)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground // colour will change based on light/dark mode
        // If navigation bar is visible, hide it
        self.navigationController?.navigationBar.isHidden = true
        self.setUpUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func setUpUI(){
        self.view.addSubview(authHeaderView)
        self.view.addSubview(usernameField)
        self.view.addSubview(passwordField)
        
        authHeaderView.translatesAutoresizingMaskIntoConstraints = false
        usernameField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            // layoutMarginsGuide will prevent app screen go over status bar
            self.authHeaderView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            self.authHeaderView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.authHeaderView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.authHeaderView.heightAnchor.constraint(equalToConstant: 222),
            
            self.usernameField.topAnchor.constraint(equalTo: self.authHeaderView.bottomAnchor, constant: 12),
            self.usernameField.centerXAnchor.constraint(equalTo: self.authHeaderView.centerXAnchor),
            self.usernameField.heightAnchor.constraint(equalToConstant: 55),
            self.usernameField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier:  0.85),
            
            self.passwordField.topAnchor.constraint(equalTo: self.usernameField.bottomAnchor, constant: 22),
            self.passwordField.centerXAnchor.constraint(equalTo: self.usernameField.centerXAnchor),
            self.passwordField.heightAnchor.constraint(equalToConstant: 55),
            self.passwordField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier:  0.85)
            
        ])
        
        
    }
}
