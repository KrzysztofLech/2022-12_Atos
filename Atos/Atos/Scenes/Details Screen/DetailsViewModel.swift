//  DetailsViewModel.swift
//  Created by Krzysztof Lech on 28/12/2022.

import Foundation

internal protocol DetailsViewModelProtocol {
    var title: String { get }
}

internal class DetailsViewModel: DetailsViewModelProtocol {
    internal var title: String {
        return "Author name"
    }
}
