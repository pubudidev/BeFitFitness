//
//  ProfileViewController.swift
//  BeFitFitness
//
//  Created by Pubudidev on 5/18/23.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private let heightField = PrimaryTextField(fieldType: .height)
    private let weightField = PrimaryTextField(fieldType: .weight)
    private let fitnessGoalField = PrimaryTextField(fieldType: .fitnessGoal)
    private var ageValue: String? = "0"
    private var birthdayVal: String? = "0"
    
    private let gradiantlayer: CAGradientLayer = {
        let caLayer = CAGradientLayer()
        //caLayer.frame = view.bounds
        return caLayer
    }()
    private let birthdayLabel: UILabel = {
        let birthdayLabel = UILabel()
        birthdayLabel.text = "Birthday : "
        birthdayLabel.font = UIFont.systemFont(ofSize: 16)
        birthdayLabel.layer.masksToBounds = true
        birthdayLabel.layer.cornerRadius = 10
        birthdayLabel.textAlignment = .center
        birthdayLabel.backgroundColor = .secondarySystemBackground
        birthdayLabel.textColor = .systemGray
        return birthdayLabel
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.text = "UserName: N/A"
        return label
        
    }()
    
    
    private var birthdayDatePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .compact
        return datePicker
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.text = "Email : N/A"
        return label
        
    }()
    
    private let ageLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.text = "Age: N/A"
        return label
        
    }()
    
    private let upadteButton: UIButton = {
        let button = PrimaryButton(title: "Update info", hasBackground: true, fontSize: .med)
        //button.setTitle("Calculate BMI", for: .normal)
        button.addTarget(self, action: #selector(updateInfo), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        title = "Profile"
        navigationController?.navigationBar.prefersLargeTitles = true
        self.tabBarController?.navigationController?.navigationBar.isHidden = false
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        birthdayDatePicker.addTarget(self, action: #selector(datePickerValueChanged), for: .valueChanged)
        
        setUpUI()
        fetchUser()
    }
    
    private func setUpUI(){
        self.view.addSubview(titleLabel)
        self.view.addSubview(subTitleLabel)
        self.view.addSubview(heightField)
        self.view.addSubview(weightField)
        self.view.addSubview(birthdayLabel)
        self.view.addSubview(birthdayDatePicker)
        self.view.addSubview(ageLabel)
        self.view.addSubview(fitnessGoalField)
        self.view.addSubview(upadteButton)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        heightField.translatesAutoresizingMaskIntoConstraints = false
        weightField.translatesAutoresizingMaskIntoConstraints = false
        birthdayLabel.translatesAutoresizingMaskIntoConstraints = false
        birthdayDatePicker.translatesAutoresizingMaskIntoConstraints = false
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        fitnessGoalField.translatesAutoresizingMaskIntoConstraints = false
        upadteButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor, constant: 30),
            titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
            subTitleLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 12),
            subTitleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            subTitleLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
            ageLabel.topAnchor.constraint(equalTo: self.subTitleLabel.bottomAnchor, constant: 12),
            ageLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            ageLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
            heightField.topAnchor.constraint(equalTo: self.ageLabel.bottomAnchor, constant: 12),
            heightField.centerXAnchor.constraint(equalTo: self.titleLabel.centerXAnchor),
            heightField.heightAnchor.constraint(equalToConstant: 55),
            heightField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier:  0.85),
            
            weightField.topAnchor.constraint(equalTo: self.heightField.bottomAnchor, constant: 22),
            weightField.centerXAnchor.constraint(equalTo: self.titleLabel.centerXAnchor),
            weightField.heightAnchor.constraint(equalToConstant: 55),
            weightField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier:  0.85),
            
            fitnessGoalField.topAnchor.constraint(equalTo: self.weightField.bottomAnchor, constant: 22),
            fitnessGoalField.centerXAnchor.constraint(equalTo: self.titleLabel.centerXAnchor),
            fitnessGoalField.heightAnchor.constraint(equalToConstant: 55),
            fitnessGoalField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier:  0.85),
            
            birthdayLabel.topAnchor.constraint(equalTo: self.fitnessGoalField.bottomAnchor, constant: 22),
            birthdayLabel.leadingAnchor.constraint(equalTo: self.weightField.leadingAnchor),
            birthdayLabel.heightAnchor.constraint(equalToConstant: 40),
            birthdayLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier:  0.40),
            
            birthdayDatePicker.topAnchor.constraint(equalTo: self.fitnessGoalField.bottomAnchor, constant: 22),
            birthdayDatePicker.leadingAnchor.constraint(equalTo: self.birthdayLabel.trailingAnchor, constant: 35),
            birthdayDatePicker.heightAnchor.constraint(equalToConstant: 40),
            birthdayDatePicker.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier:  20),
            
            upadteButton.topAnchor.constraint(equalTo: self.birthdayDatePicker.bottomAnchor, constant: 22),
            upadteButton.centerXAnchor.constraint(equalTo: self.titleLabel.centerXAnchor),
            upadteButton.heightAnchor.constraint(equalToConstant: 55),
            upadteButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier:  0.85),
            
        ])
        
    }
    
    func textFieldShouldBeginEditing(_ birthdayLabel: UITextField) -> Bool {
        // Show the date picker when the text field is tapped
        //birthdayCalendarField.isHidden = false
        return true
    }
    
    // MARK: - Date picker value changed
    
    @objc func datePickerValueChanged(sender: UIDatePicker) {
        print("touch")
        self.convertAge(date: sender.date)
    }
    
    
    func convertAge(date: Date) {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        
        let calendar = Calendar.current
        let dateString = formatter.string(from: date)
        let ageComponents = calendar.dateComponents([.year], from: date, to: Date())
        let age = ageComponents.year ?? 0
        //ageLabel.text = formatter.string(from: sender.date)
        ageValue = String(age)
        birthdayVal = dateString
        ageLabel.text = "Age : \(age)"
    }
    
    private func fetchUser(){
        
        AuthService.shared.fetchUser (completion: { [weak self] user, error in
            guard let self = self else { return }
            if let error = error{
                print(error)
                AlertManager.showFetchUserError(on: self)
                return
            }else{
                
                
                //self.birthdayDatePicker.date = dateformater.date(from: "May 12, 1985") ?? "May 12, 1985"
                //(from: user?.birthday)
                self.titleLabel.text = user?.username ?? "N/A"
                self.subTitleLabel.text = user?.email ?? "N/A"
                self.weightField.text = user?.weight ?? "N/A"
                self.heightField.text = user?.height ?? "N/A"
                self.fitnessGoalField.text = user?.finessGoal ?? "N/A"
                self.birthdayVal = user?.birthday ?? "N/A"
                
                // Create a date formatter
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "MMM d, yyyy"
                
                // Convert the date string to a Date object
                if let date = dateFormatter.date(from: user!.birthday) {
                    self.birthdayDatePicker.datePickerMode = .date
                    self.birthdayDatePicker.date = date
                    self.convertAge(date: date)
                    print(self.birthdayDatePicker.date)
                    
                } else {
                    print("Failed to convert the date string.")
                }
            }
        })
    }
    
    
    @objc func updateInfo() {
        print("update Tapped")
        
        guard let height = Double(heightField.text ?? ""),
              height > 0 else {
            AlertManager.showHeightFieldError(on: self)
            return
        }
        guard let weight = Double(weightField.text ?? ""),
              weight > 0 else {
            AlertManager.showWeightFieldError(on: self)
            return
        }
        
        let updateuser = UpdateUser(
            weight: self.weightField.text ?? "0.0", height: self.heightField.text ?? "0.0", finessGoal: self.fitnessGoalField.text ?? "", birthday: self.birthdayVal ?? "")
        
        
        AuthService.shared.updateUser(with: updateuser, completion: { [weak self] error in
            guard let self = self else { return }
            
            if let error = error {
                print(error)
                AlertManager.showUpdateUserError(on: self)
                return
            } else {
                self.fetchUser()
            }
        })
    }
}
