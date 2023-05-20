//
//  TabMenuViewController.swift
//  BeFitFitness
//
//  Created by Pubudidev on 5/18/23.
//

import UIKit

class TabMenuViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        confugureMenuItems()
    }
    
    func confugureMenuItems() {
        let homeController = UINavigationController(rootViewController: HomeViewController())
        let schedularController = UINavigationController(rootViewController: ScheduleViewController())
        let BMICalculatorController = UINavigationController(rootViewController: BMICalculatorViewController())
        let profileController = UINavigationController(rootViewController: ProfileViewController())
        
        //BMICalculatorController.isNavigationBarHidden = true
        //schedularController.isNavigationBarHidden = true
        //profileController.isNavigationBarHidden = true
        
        homeController.tabBarItem.image = UIImage(systemName: "house")
        schedularController.tabBarItem.image = UIImage(systemName: "calendar.circle")
        BMICalculatorController.tabBarItem.image = UIImage(systemName: "heart.circle.fill")
        profileController.tabBarItem.image = UIImage(systemName: "person.circle")
        
        homeController.title = "Home"
        schedularController.title = "Schedule"
        BMICalculatorController.title = "BMI\nCalculator"
        profileController.title = "Profile"
        
        tabBar.tintColor = .red
        setViewControllers([homeController, schedularController, BMICalculatorController, profileController], animated: true)
    }
}
