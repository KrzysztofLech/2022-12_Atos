//  DetailsViewController.swift
//  Created by Krzysztof Lech on 28/12/2022.

import UIKit

internal protocol DetailsViewControllerDelegate: AnyObject {
    func close()
}

internal class DetailsViewController: UIViewController {
    private let viewModel: DetailsViewModelProtocol
    private weak var delegate: DetailsViewControllerDelegate?

    internal init(viewModel: DetailsViewModelProtocol, delegate: DetailsViewControllerDelegate) {
        self.viewModel = viewModel
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }

    required internal init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationItem.title = viewModel.title
    }

    deinit {
        Logger.log(info: "Deinit DetailsViewController")
    }

    override internal func viewDidLoad() {
        super.viewDidLoad()
    }
}
