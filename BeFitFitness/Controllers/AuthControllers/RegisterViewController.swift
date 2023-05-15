//
//  RegisterViewController.swift
//  BeFitFitness
//
//  Created by Pubudidev on 5/12/23.
//

import UIKit

class RegisterViewController: UIViewController {
    
    private let authHeaderView = AuthenticationHeaderView(title: "Sign Up", subTitle: "Create Your Account")
    
    private let usernameField = PrimaryTextField(fieldType: .username)
    private let emailField = PrimaryTextField(fieldType: .email)
    private let passwordField = PrimaryTextField(fieldType: .password)
    
    private let signUpButton = PrimaryButton(title: "Sign Up.", hasBackground: true, fontSize: .big)
    private let signInButton = PrimaryButton(title: "Alredy have an account? Sign In.", fontSize: .med)
    
    private let termTextView: UITextView = {
        let textView = UITextView()
        textView.text = "By creating an  account you agree with our terms and conditions"
        textView.backgroundColor = .clear
        textView.textColor = .label
        textView.isSelectable = true
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        
        self.setUpUI()
        
        
        self.signUpButton.addTarget(self, action: #selector(didTapSignUp), for: .touchUpInside)
        self.signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
        
    }
    @objc func didTapSignUp(){
        print("DEBUG PRINT:", "didTapSignUp")
    }
    
    @objc func didTapSignIn(){
        //print("DEBUG PRINT:", "didTapSignUp")
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        
        // dev perpose
        // self.didTapNewUser()
    }
    
    func setUpUI(){
        self.view.addSubview(authHeaderView)
        self.view.addSubview(usernameField)
        self.view.addSubview(emailField)
        self.view.addSubview(passwordField)
        self.view.addSubview(signUpButton)
        self.view.addSubview(termTextView)
        self.view.addSubview(signInButton)
        
        self.authHeaderView.translatesAutoresizingMaskIntoConstraints = false
        self.usernameField.translatesAutoresizingMaskIntoConstraints = false
        self.emailField.translatesAutoresizingMaskIntoConstraints = false
        self.passwordField.translatesAutoresizingMaskIntoConstraints = false
        self.signUpButton.translatesAutoresizingMaskIntoConstraints = false
        self.termTextView.translatesAutoresizingMaskIntoConstraints = false
        self.signInButton.translatesAutoresizingMaskIntoConstraints = false
        
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
            
            self.emailField.topAnchor.constraint(equalTo: self.usernameField.bottomAnchor, constant: 12),
            self.emailField.centerXAnchor.constraint(equalTo: self.authHeaderView.centerXAnchor),
            self.emailField.heightAnchor.constraint(equalToConstant: 55),
            self.emailField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier:  0.85),
            
            self.passwordField.topAnchor.constraint(equalTo: self.emailField.bottomAnchor, constant: 22),
            self.passwordField.centerXAnchor.constraint(equalTo: self.authHeaderView.centerXAnchor),
            self.passwordField.heightAnchor.constraint(equalToConstant: 55),
            self.passwordField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier:  0.85),
            
            self.signUpButton.topAnchor.constraint(equalTo: self.passwordField.bottomAnchor, constant: 22),
            self.signUpButton.centerXAnchor.constraint(equalTo: self.authHeaderView.centerXAnchor),
            self.signUpButton.heightAnchor.constraint(equalToConstant: 55),
            self.signUpButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier:  0.85),
            
            self.termTextView.topAnchor.constraint(equalTo: self.signUpButton.bottomAnchor, constant: 6),
            self.termTextView.centerXAnchor.constraint(equalTo: self.authHeaderView.centerXAnchor),
            self.termTextView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier:  0.85),
            
            self.signInButton.topAnchor.constraint(equalTo: self.termTextView.bottomAnchor, constant: 11),
            self.signInButton.centerXAnchor.constraint(equalTo: self.authHeaderView.centerXAnchor),
            self.signInButton.heightAnchor.constraint(equalToConstant: 44),
            self.signInButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier:  0.85),
            
        ])
    }
}
