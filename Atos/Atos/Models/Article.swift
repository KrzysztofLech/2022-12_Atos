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
