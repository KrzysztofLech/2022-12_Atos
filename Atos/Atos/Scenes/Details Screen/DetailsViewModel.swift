//  DetailsViewModel.swift
//  Created by Krzysztof Lech on 28/12/2022.

import Foundation

internal protocol DetailsViewModelProtocol {
    var title: String { get }
}

internal class DetailsViewModel: DetailsViewModelProtocol {
    private let article: ArticleViewModel

    internal init(article: ArticleViewModel) {
        self.article = article
    }

    // Too long string will be cut off
    internal var title: String {
        var string = article.author
        if string.count > 15 {
            string = string.prefix(15) + "..."
        }

        return string
    }
}
