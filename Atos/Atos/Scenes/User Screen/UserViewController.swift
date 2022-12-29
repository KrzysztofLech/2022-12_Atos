//  UserViewController.swift
//  Created by Krzysztof Lech on 28/12/2022.

import UIKit

internal class UserViewController: UIViewController {
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var nameTitleLabel: UILabel!
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var lastLoginTitleLabel: UILabel!
    @IBOutlet private var lastLoginDateLabel: UILabel!

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
        setupView()
    }

    private func setupView() {
        navigationItem.title = viewModel.title
        imageView.image = UIImage(named: viewModel.userImageName)

        nameTitleLabel.text = viewModel.userNameTitle
        nameLabel.text = viewModel.userName

        lastLoginTitleLabel.text = viewModel.lastLoginTitle
        lastLoginDateLabel.text = viewModel.lastLoginDate
    }
}
