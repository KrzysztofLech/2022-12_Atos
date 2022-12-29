//  LoginViewController.swift
//  Created by Krzysztof Lech on 28/12/2022.

import UIKit

internal protocol LoginViewControllerDelegate: AnyObject {
    func logged()
    func loginWithError(_ error: AtosError)
}

internal class LoginViewController: UIViewController {
    @IBOutlet private var loginTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    @IBOutlet private var loginButton: UIButton!


    private let viewModel: LoginViewModelProtocol
    private weak var delegate: LoginViewControllerDelegate?

    internal init(viewModel: LoginViewModelProtocol, delegate: LoginViewControllerDelegate) {
        self.viewModel = viewModel
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }

    required internal init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        Logger.log(info: "Deinit LoginViewController")
    }

    override internal func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    private func setupView() {
        loginTextField.placeholder = viewModel.loginPlaceholder
        passwordTextField.placeholder = viewModel.passwordPlaceholder
        loginTextField.becomeFirstResponder()

        loginButton.layer.cornerRadius = 6
        loginButton.setTitle(viewModel.loginButtonTitle, for: .normal)
    }

    @IBAction private func didTapOnLoginButton() {
        passwordTextField.isSecureTextEntry = false
        let password = passwordTextField.text
        passwordTextField.isSecureTextEntry = true

        viewModel.login(login: loginTextField.text, password: password) { atosError in
            if let atosError {
                delegate?.loginWithError(atosError)
            } else {
                delegate?.logged()
            }
        }
    }
}
