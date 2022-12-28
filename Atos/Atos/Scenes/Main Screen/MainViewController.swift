//  MainViewController.swift
//  Created by Krzysztof Lech on 28/12/2022.

import UIKit

internal protocol MainViewControllerDelegate: AnyObject {
    func showDetails()
}

internal class MainViewController: UIViewController {
    private let viewModel: MainViewModelProtocol
    private weak var delegate: MainViewControllerDelegate?

    internal init(viewModel: MainViewModelProtocol, delegate: MainViewControllerDelegate) {
        self.viewModel = viewModel
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationItem.title = viewModel.title
        navigationItem.backButtonTitle = viewModel.backButtonTitle
    }

    required internal init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        Logger.log(info: "Deinit MainViewController")
    }

    override internal func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction private func didTapOnItem() {
        delegate?.showDetails()
    }
}
