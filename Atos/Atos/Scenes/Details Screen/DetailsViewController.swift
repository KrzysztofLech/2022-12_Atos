//  DetailsViewController.swift
//  Created by Krzysztof Lech on 28/12/2022.

import UIKit

internal class DetailsViewController: UIViewController {
    private let viewModel: DetailsViewModelProtocol

    internal init(viewModel: DetailsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required internal init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        Logger.log(info: "Deinit DetailsViewController")
    }

    override internal func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = viewModel.title
    }
}
