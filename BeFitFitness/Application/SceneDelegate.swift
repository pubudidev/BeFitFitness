//
//  SceneDelegate.swift
//  BeFitFitness
//
//  Created by Pubudidev on 5/10/23.
//

import UIKit
import FirebaseAuth

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        self.setupWindow(with: scene)
        self.checkAuthentication()
    }
    
    // Create seperate custom function to setup window scene
    private func setupWindow(with scene: UIScene) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
                let window = UIWindow(windowScene: windowScene)
                self.window = window
                self.window?.makeKeyAndVisible()

    }
    
    public func checkAuthentication() {
        // Checking for any user is aready logged in. if a user already logged in then firebase keep track of the logged in users status.
        if Auth.auth().currentUser == nil {
            self.goToController(with: LoginViewController())
        } else {
            self.goToController(with: TabMenuViewController())
        }
    }

    // Animating for load Vies smoothly
    private func goToController(with viewController: UIViewController) {
        
        // if we doin UI related stuff such as go back and forth in different UIs it is better to do it in main thread. so it keep handling all the UI related things. and this give us smooth UI loading and respondings
        DispatchQueue.main.async { [weak self] in
            // Load a black screen first and then show stuffs in the loaded UI
            UIView.animate(withDuration: 0.25) {
                self?.window?.layer.opacity = 0

            } completion: { [weak self] _ in

                let nav = UINavigationController(rootViewController: viewController)
                nav.modalPresentationStyle = .fullScreen
                self?.window?.rootViewController = nav

                UIView.animate(withDuration: 0.25) { [weak self] in
                    self?.window?.layer.opacity = 1
                }
            }
        }
    }
    
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
        
        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
    
    
}

