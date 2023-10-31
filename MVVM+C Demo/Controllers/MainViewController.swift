//
//  MainViewController.swift
//  MVVM+C Demo
//
//  Created by Dmitry Gorbunow on 10/30/23.
//

import UIKit

class MainViewController: UIViewController {

    var viewModel : MainViewModel
    
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Main"
    }
}
