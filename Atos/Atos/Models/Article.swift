//  Article.swift
//  Created by Krzysztof Lech on 29/12/2022.

import Foundation

internal struct Article: Decodable {
    let author: String?
    let title: String?
    let description: String?
    let publishedAt: String?
    let urlToImage: URL?
}

internal struct ArticleViewModel {
    private let article: Article

    internal init(article: Article) {
        self.article = article
    }

    internal var author: String {
        let defaultAuthor = Strings.MainScreen.unknownAuthorTitle

        guard let author = article.author else { return defaultAuthor }

        if author.hasPrefix("https://") {
            return defaultAuthor
        } else {
            return author
        }
    }

    // Too long string will be cut off
    internal var screenTitle: String {
        var string = author
        if string.count > 15 {
            string = string.prefix(15) + "..."
        }
        return string
    }

    internal var title: String? {
        return article.title
    }

    internal var description: String? {
        return article.description
    }

    internal var publishedAt: String? {
        return article.publishedAt
    }

    internal var urlToImage: URL? {
        return article.urlToImage
    }
}
