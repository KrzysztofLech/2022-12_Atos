//  DetailsViewController.swift
//  Created by Krzysztof Lech on 28/12/2022.

import Kingfisher
import UIKit

internal class DetailsViewController: UIViewController {
    @IBOutlet private var authorLabel: UILabel!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var descriptionTitleLabel: UILabel!
    @IBOutlet private var descriptionTextLabel: UILabel!
    @IBOutlet private var publishedTitleLabel: UILabel!
    @IBOutlet private var publishedDateLabel: UILabel!
    @IBOutlet private var imageView: UIImageView!

    private let viewModel: ArticleViewModel

    internal init(viewModel: ArticleViewModel) {
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
        setupView()
        showImage()
    }
}

private extension DetailsViewController {
    func setupView() {
        navigationItem.title = viewModel.screenTitle

        authorLabel.text = viewModel.author
        titleLabel.text = viewModel.title
        descriptionTitleLabel.text = Strings.DetailsScreen.descriptionTitle
        descriptionTextLabel.text = viewModel.description
        publishedTitleLabel.text = Strings.DetailsScreen.publishedTitle
        publishedDateLabel.text = viewModel.publishedAt
    }

    func showImage() {
        guard let imageUrl = viewModel.urlToImage else { return }
        imageView.kf.setImage(with: imageUrl)
    }
}
