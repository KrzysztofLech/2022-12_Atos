//  MainViewController.swift
//  Created by Krzysztof Lech on 28/12/2022.

import UIKit

internal protocol MainViewControllerDelegate: AnyObject {
    func showDetails()
}

internal class MainViewController: UIViewController {
    @IBOutlet private var activityIndicator: UIActivityIndicatorView!



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

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getData()
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

    private func getData() {
        viewModel.getData { [weak self] atosError in
            self?.activityIndicator.isHidden = true
            if let atosError {
                print(atosError.title)
            } else {
                /// pokazać dane
            }
        }
    }


    @IBAction private func didTapOnItem() {
        delegate?.showDetails()
    }
}
