//  MainViewController.swift
//  Created by Krzysztof Lech on 28/12/2022.

import UIKit

internal protocol MainViewControllerDelegate: AnyObject {
    func showArticleDetails(_ article: ArticleViewModel)
    func showAlert(with error: AtosError, completion: (() -> Void)?)
}

internal class MainViewController: UIViewController {
    @IBOutlet private var activityIndicator: UIActivityIndicatorView!
    @IBOutlet private var tableView: UITableView!

    private let viewModel: MainViewModelProtocol
    private weak var delegate: MainViewControllerDelegate?

    internal init(viewModel: MainViewModelProtocol, delegate: MainViewControllerDelegate) {
        self.viewModel = viewModel
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }

    required internal init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        Logger.log(info: "Deinit MainViewController")
    }

    override internal func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        getData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: false)
        }
    }
}

private extension MainViewController {
    func setupView() {
        navigationItem.title = viewModel.title
        navigationItem.backButtonTitle = viewModel.backButtonTitle

        tableView.register(
            UINib(nibName: ArticleTableViewCell.className, bundle: nil),
            forCellReuseIdentifier: ArticleTableViewCell.className
        )
    }

    func getData() {
        activityIndicator.isHidden = false
        viewModel.getArticles { [weak self] atosError in
            self?.activityIndicator.isHidden = true
            if let atosError {
                self?.delegate?.showAlert(with: atosError) {
                    self?.getData()
                }
            } else {
                self?.tableView.reloadData()
            }
        }
    }
}

extension MainViewController: UITableViewDataSource {
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.articlesCount
    }

    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.className, for: indexPath) as? ArticleTableViewCell
        else { return UITableViewCell() }

        let article = viewModel.getArticle(atIndex: indexPath)
        cell.configure(with: article)
        return cell
    }
}

extension MainViewController: UITableViewDelegate {
    internal func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = viewModel.getArticle(atIndex: indexPath)
        delegate?.showArticleDetails(article)
    }
}
