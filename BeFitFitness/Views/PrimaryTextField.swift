//
//  CustomTextField.swift
//  BeFitFitness
//
//  Created by Pubudidev on 5/14/23.
//

import UIKit

class PrimaryTextField: UITextField {
    
    private let textFieldType: CustomTextFieldType
    
    init(fieldType: CustomTextFieldType){
        self.textFieldType = fieldType
        super.init(frame: .zero)
        
        self.backgroundColor = .secondarySystemBackground
        self.layer.cornerRadius = 10
        
        self.returnKeyType = .done
        self.autocorrectionType = .no
        self.autocapitalizationType = .none
        
        self.leftViewMode = .always
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: self.frame.size.height))
        
        switch fieldType {
        case .username:
            self.placeholder = "Username"
        case .email:
            self.placeholder = "Email Address"
            self.keyboardType = .emailAddress
            self.textContentType = .emailAddress
        case .password:
            self.placeholder = "Password"
            self.textContentType = .oneTimeCode
            self.isSecureTextEntry = true
        case .height:
            self.placeholder = "Weight"
        case .weight:
            self.placeholder = "Height"
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
