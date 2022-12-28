//  UserViewController.swift
//  Created by Krzysztof Lech on 28/12/2022.

import UIKit

internal class UserViewController: UIViewController {
    private let viewModel: UserViewModelProtocol

    internal init(viewModel: UserViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required internal init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        Logger.log(info: "Deinit UserViewController")
    }

    override internal func viewDidLoad() {
        super.viewDidLoad()
    }
}
