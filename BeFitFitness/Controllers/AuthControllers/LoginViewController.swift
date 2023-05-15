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
    
    private let signInButton = PrimaryButton(title: "Sign In", hasBackground: true, fontSize: .big)
    private let newUserButton = PrimaryButton(title: "New user? Create Account", fontSize: .med)
    private let forgotPasswordButton = PrimaryButton(title: "Forgot Password?", fontSize: .small)
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground // colour will change based on light/dark mode
        // If navigation bar is visible, hide it
        self.navigationController?.navigationBar.isHidden = true
        self.setUpUI()
        
        self.signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
        self.newUserButton.addTarget(self, action: #selector(didTapNewUser), for: .touchUpInside)
        self.forgotPasswordButton.addTarget(self, action: #selector(didTapForgotPassword), for: .touchUpInside)
    }
    
    @objc func didTapSignIn(){
        print("DEBUG PRINT:", "didTapSignIn")
        let vc = HomeViewController()
                 vc.modalPresentationStyle = .fullScreen
                 self.present(vc, animated: false, completion: nil)
    }
    
    @objc func didTapNewUser(){
        print("DEBUG PRINT:", "didTapNewUser")
        let vc = RegisterViewController()
                 self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func didTapForgotPassword(){
        print("DEBUG PRINT:", "didTapNewUser")
        let vc = ForgotPasswordViewController()
                 self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        //self.didTapNewUser()
    }
    
    func setUpUI(){
        self.view.addSubview(authHeaderView)
        self.view.addSubview(usernameField)
        self.view.addSubview(passwordField)
        self.view.addSubview(signInButton)
        self.view.addSubview(newUserButton)
        self.view.addSubview(forgotPasswordButton)
        
        authHeaderView.translatesAutoresizingMaskIntoConstraints = false
        usernameField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        newUserButton.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        
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
            self.passwordField.centerXAnchor.constraint(equalTo: self.authHeaderView.centerXAnchor),
            self.passwordField.heightAnchor.constraint(equalToConstant: 55),
            self.passwordField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier:  0.85),
            
            self.signInButton.topAnchor.constraint(equalTo: self.passwordField.bottomAnchor, constant: 22),
            self.signInButton.centerXAnchor.constraint(equalTo: self.authHeaderView.centerXAnchor),
            self.signInButton.heightAnchor.constraint(equalToConstant: 55),
            self.signInButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier:  0.85),
            
            self.newUserButton.topAnchor.constraint(equalTo: self.signInButton.bottomAnchor, constant: 11),
            self.newUserButton.centerXAnchor.constraint(equalTo: self.authHeaderView.centerXAnchor),
            self.newUserButton.heightAnchor.constraint(equalToConstant: 44),
            self.newUserButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier:  0.85),
            
            self.forgotPasswordButton.topAnchor.constraint(equalTo: self.newUserButton.bottomAnchor, constant: 6    ),
            self.forgotPasswordButton.centerXAnchor.constraint(equalTo: self.authHeaderView.centerXAnchor),
            self.forgotPasswordButton.heightAnchor.constraint(equalToConstant: 44),
            self.forgotPasswordButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier:  0.85)
            
        ])
    }
}
