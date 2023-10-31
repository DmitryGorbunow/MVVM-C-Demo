//
//  ViewModel.swift
//  MVVM+C Demo
//
//  Created by Dmitry Gorbunow on 10/29/23.
//

import Foundation

final class LoginViewModel {
    
    weak var coordinator : AppCoordinator?
    var statusText = Bindable("")
    
    func userButtonPressed(login: String, password: String) {
//        if login != User.logins[0].login || password != User.logins[0].password {
//            statusText.value = "Log in failed."
//        } else {
//            statusText.value = "You successfully logged in."
//        }
        
        coordinator?.goToMainPage()
    }
}
