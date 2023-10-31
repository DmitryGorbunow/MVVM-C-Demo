//
//  AuthCoordinator.swift
//  MVVM+C Demo
//
//  Created by Dmitry Gorbunow on 10/31/23.
//

import UIKit

class AuthCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    init(navigationController : UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        
    }
    
}

