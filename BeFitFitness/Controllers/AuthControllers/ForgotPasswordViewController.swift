//
//  ForgotPasswordViewController.swift
//  BeFitFitness
//
//  Created by Pubudidev on 5/12/23.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    private let authHeaderView = AuthenticationHeaderView(title: "Forgot Password", subTitle: "Reset your password")

        private let emailField = PrimaryTextField(fieldType: .email)

        private let resetPasswordButton = PrimaryButton(title: "Reset Password", hasBackground: true, fontSize: .big)
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupUI()

                 self.resetPasswordButton.addTarget(self, action: #selector(didTapForgotPassword), for: .touchUpInside)
             }

             override func viewWillAppear(_ animated: Bool) {
                 super.viewWillAppear(animated)
                 // enable navigation bar
                 self.navigationController?.navigationBar.isHidden = false
             }

             private func setupUI() {
                 self.view.backgroundColor = .systemBackground

                 self.view.addSubview(authHeaderView)
                 self.view.addSubview(emailField)
                 self.view.addSubview(resetPasswordButton)

                 authHeaderView.translatesAutoresizingMaskIntoConstraints = false
                 emailField.translatesAutoresizingMaskIntoConstraints = false
                 resetPasswordButton.translatesAutoresizingMaskIntoConstraints = false

                 NSLayoutConstraint.activate([
                     self.authHeaderView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 30),
                     self.authHeaderView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                     self.authHeaderView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                     self.authHeaderView.heightAnchor.constraint(equalToConstant: 230),

                     self.emailField.topAnchor.constraint(equalTo: authHeaderView.bottomAnchor, constant: 11),
                     self.emailField.centerXAnchor.constraint(equalTo: authHeaderView.centerXAnchor),
                     self.emailField.heightAnchor.constraint(equalToConstant: 55),
                     self.emailField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),

                     self.resetPasswordButton.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 22),
                     self.resetPasswordButton.centerXAnchor.constraint(equalTo: authHeaderView.centerXAnchor),
                     self.resetPasswordButton.heightAnchor.constraint(equalToConstant: 55),
                     self.resetPasswordButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
                 ])
             }

             @objc private func didTapForgotPassword() {
                 guard let email = self.emailField.text, !email.isEmpty else { return }
}
}
