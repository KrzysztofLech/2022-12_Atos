//  ArticleTableViewCell.swift
//  Created by Krzysztof Lech on 29/12/2022.

import UIKit

internal class ArticleTableViewCell: UITableViewCell {
    @IBOutlet private var authorLabel: UILabel!
    @IBOutlet private var titleLabel: UILabel!

    internal func configure(with article: ArticleViewModel) {
        authorLabel.text = article.author
        titleLabel.text = article.title
    }
}
