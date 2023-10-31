//
//  WelcomeViewModel.swift
//  MVVM+C Demo
//
//  Created by Dmitry Gorbunow on 10/30/23.
//

import Foundation

final class WelcomeViewModel {
    weak var coordinator : AppCoordinator?
    
    func goToLogin() {
        coordinator?.goToLoginPage()
    }
}
