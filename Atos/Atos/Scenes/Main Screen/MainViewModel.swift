//  MainViewModel.swift
//  Created by Krzysztof Lech on 28/12/2022.

import Foundation

internal protocol MainViewModelProtocol {
    var title: String { get }
    var backButtonTitle: String { get }

    func getData(completion: @escaping (AtosError?) -> Void)
}

internal class MainViewModel: MainViewModelProtocol {
    private let userService: UserServiceProtocol
    private let dataService: DataServiceProtocol
    private var articles: [Article] = []

    internal init(userService: UserServiceProtocol, dataService: DataServiceProtocol) {
        self.userService = userService
        self.dataService = dataService
    }

    internal var title: String {
        return String(format: Strings.MainScreen.mainScreenTitle, userService.name)
    }

    internal var backButtonTitle: String {
        return Strings.MainScreen.backButtonTitle
    }

    internal func getData(completion: @escaping (AtosError?) -> Void) {
        dataService.fetchData { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let articles):
                    Logger.log(okText: "Downloaded \(articles.articles.count) articles")
                    self?.articles = articles.articles
                    completion(nil)
                case .failure:
                    completion(AtosErrorType.networking.error)
                }
            }
        }
    }
}
