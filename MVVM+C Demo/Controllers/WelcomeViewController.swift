//
//  ViewController.swift
//  MVVM+C Demo
//
//  Created by Dmitry Gorbunow on 10/29/23.
//

import UIKit
import SnapKit

final class WelcomeViewController: UIViewController {
    
    var viewModel : WelcomeViewModel
    
    init(viewModel: WelcomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome to the Betta Bank!"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var logInButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 16
        button.backgroundColor = UIColor(named: "yellowButton")
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(logInButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var demoButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 16
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor(named: "yellowButton")?.cgColor
        button.setTitle("Demo", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(demoButtonTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        view.backgroundColor = .systemBackground
        view.addSubview(welcomeLabel)
        view.addSubview(logInButton)
        view.addSubview(demoButton)
        setupConstraints()
    }
    
    private func setupConstraints() {
        welcomeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(128)
            $0.left.right.equalToSuperview().inset(32)
        }
        
        logInButton.snp.makeConstraints {
            $0.left.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(64)
            $0.width.equalTo(150)
            $0.height.equalTo(49)
        }
        
        demoButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(64)
            $0.right.equalToSuperview().inset(16)
            $0.width.equalTo(150)
            $0.height.equalTo(49)
        }
    }
    
    @objc private func logInButtonTapped() {
        viewModel.goToLogin()
    }
    
    @objc private func demoButtonTapped() {
        
    }
}

