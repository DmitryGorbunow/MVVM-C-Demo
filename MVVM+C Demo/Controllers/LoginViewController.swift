//
//  LoginViewController.swift
//  MVVM+C Demo
//
//  Created by Dmitry Gorbunow on 10/29/23.
//

import UIKit

final class LoginViewController: UIViewController {
    
    var viewModel : LoginViewModel
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let loginTextField = CustomTextField(fieldType: .username)
    private let passwordTextField = CustomTextField(fieldType: .password)
    
    private lazy var logInButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 16
        button.backgroundColor = UIColor(named: "yellowButton")
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(logInButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupView()
        bindViewModel()
    }
    
    private func setupView() {
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
        view.addSubview(statusLabel)
        view.addSubview(logInButton)
        setupConstraints()
    }
    
    private func setupConstraints() {
        loginTextField.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(32)
            $0.height.equalTo(49)
            $0.top.equalToSuperview().offset(128)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(32)
            $0.height.equalTo(49)
            $0.top.equalTo(loginTextField.snp.bottom).offset(32)
        }
        
        statusLabel.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(32)
            $0.height.equalTo(30)
            $0.top.equalTo(passwordTextField.snp.bottom).offset(32)
        }
        
        logInButton.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(32)
            $0.height.equalTo(49)
            $0.bottom.equalToSuperview().offset(-64)
        }
    }
    
    func bindViewModel() {
        viewModel.statusText.bind({ (statusText) in
            DispatchQueue.main.async {
                self.statusLabel.text = statusText
            }
        })
    }
    
    @objc private func logInButtonTapped() {
        viewModel.userButtonPressed(login: loginTextField.text ?? "", password: passwordTextField.text ?? "")
//        let vc = MainViewController()
//        navigationController?.pushViewController(vc, animated: true)
    }
}
