//
//  AppCoordinator.swift
//  MVVM+C Demo
//
//  Created by Dmitry Gorbunow on 10/30/23.
//

import UIKit

class AppCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    var isLoggedIn: Bool = false
    
    init(navCon : UINavigationController) {
        self.navigationController = navCon
    }
    
    func start() {
        if isLoggedIn {
            goToMainPage()
        } else {
            goToWelcomePage()
        }
    }
    
    func goToWelcomePage() {
        let welcomeViewModel = WelcomeViewModel()
        welcomeViewModel.coordinator = self
        let welcomeVC = WelcomeViewController(viewModel: welcomeViewModel)
        navigationController.pushViewController(welcomeVC, animated: true)
    }
    
    func goToLoginPage() {
        let loginViewModel = LoginViewModel()
        loginViewModel.coordinator = self
        let loginVC = LoginViewController(viewModel: loginViewModel)
        navigationController.pushViewController(loginVC, animated: true)
    }
    
    func goToMainPage() {
        let mainViewModel = MainViewModel()
        mainViewModel.coordinator = self
        let mainVC = MainViewController(viewModel: mainViewModel)
        navigationController.viewControllers.removeAll()
        navigationController.pushViewController(mainVC, animated: true)
    }
}
