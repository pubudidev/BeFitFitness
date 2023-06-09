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
        let attributedString = NSMutableAttributedString(string: "By creating an account, you agree to our Terms & Conditions and you acknowledge that you have read our Privacy Policy.")
        
        attributedString.addAttribute(.link, value: "terms://termsAndConditions", range: (attributedString.string as NSString).range(of: "Terms & Conditions"))
        
        attributedString.addAttribute(.link, value: "privacy://privacyPolicy", range: (attributedString.string as NSString).range(of: "Privacy Policy"))
        let textView = UITextView()
        
        attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 12), range: (attributedString.string as NSString).range(of: "By creating an account, you agree to our Terms & Conditions and you acknowledge that you have read our Privacy Policy."))
        
        // set the link colors. this takes the NSMutableAttributedString values as Dictionary and apply colors
        textView.linkTextAttributes = [.foregroundColor: UIColor.systemBlue]
        textView.backgroundColor = .clear
        textView.textColor = .label
        textView.attributedText = attributedString
        textView.isSelectable = true
        textView.isEditable = false
        textView.delaysContentTouches = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        
        self.setUpUI()
        
        self.termTextView.delegate = self
        
        self.signUpButton.addTarget(self, action: #selector(didTapSignUp), for: .touchUpInside)
        self.signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
        
    }
    @objc func  didTapSignIn(){
        print("DEBUG PRINT:", "didTapSignUp")
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @objc func didTapSignUp(){
        //print("DEBUG PRINT:", "didTapSignUp")
        let registerUserRequest = RegiserUserAPIRequest(
            username: self.usernameField.text ?? "",
            email: self.emailField.text ?? "",
            password: self.passwordField.text ?? ""
        )
        
        // Username check
        if !Validator.isValidUsername(for: registerUserRequest.username) {
            AlertManager.showInvalidUsernameAlert(on: self)
            return
        }
        
        // Email check
        if !Validator.isValidEmail(for: registerUserRequest.email) {
            AlertManager.showInvalidEmailAlert(on: self)
            return
        }
        
        // Password check
        if !Validator.isPasswordValid(for: registerUserRequest.password) {
            AlertManager.showInvalidPasswordAlert(on: self)
            return
        }
        
        AuthService.shared.registerUser(with: registerUserRequest) { [weak self] wasRegistered, error in
            guard let self = self else { return }
            
            if let error = error {
                AlertManager.showRegistrationErrorAlert(on: self, with: error)
                return
            }
            
            if wasRegistered {
                if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
                    sceneDelegate.checkAuthentication()
                }
            } else {
                AlertManager.showRegistrationErrorAlert(on: self)
            }
        }
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
extension RegisterViewController: UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        
        if URL.scheme == "terms" {
            self.showWebViewerController(with: "https://policies.google.com/terms?hl=en")
        } else if URL.scheme == "privacy" {
            self.showWebViewerController(with: "https://policies.google.com/privacy?hl=en")
        }
        
        return true
    }
    
    private func showWebViewerController(with urlString: String) {
        let vc = WebViewerController(with: urlString)
        let nav = UINavigationController(rootViewController: vc)
        self.present(nav, animated: true, completion: nil)
    }
    
    func textViewDidChangeSelection(_ textView: UITextView) {
        textView.delegate = nil
        textView.selectedTextRange = nil
        textView.delegate = self
    }
}
