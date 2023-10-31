//
//  Coordinator.swift
//  MVVM+C Demo
//
//  Created by Dmitry Gorbunow on 10/30/23.
//

import UIKit

protocol Coordinator {
    var parentCoordinator: Coordinator? { get set }
    var children: [Coordinator] { get set }
    var navigationController : UINavigationController { get set }
    
    func start()
}

