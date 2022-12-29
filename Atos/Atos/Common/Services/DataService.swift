//  DataService.swift
//  Created by Krzysztof Lech on 29/12/2022.

import Foundation

protocol DataServiceProtocol {
    func fetchData(completion: @escaping (Result<Articles, NetworkingError>) -> ())
}

final class DataService: DataServiceProtocol {

    private enum Constants {
        static let endpoint = "https://newsapi.org/v2/top-headlines?country=us&apiKey=8906011f7dc14fddbbdf5bbc47b93e3a"
    }

    private var downloadTask: URLSessionDownloadTask?

    func fetchData(completion: @escaping (Result<Articles, NetworkingError>) -> ()) {
        guard let url = URL(string: Constants.endpoint) else {
            completion(.failure(.url))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                if let err = error as? URLError, err.code == .notConnectedToInternet {
                    completion(.failure(.noInternet))
                } else {
                    completion(.failure(.network))
                }
                return
            }

            else if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                completion(.failure(.statusCode))
                return
            }

            guard let data = data else {
                completion(.failure(.other))
                return
            }

            do {
                let responseData = try JSONDecoder().decode(Articles.self, from: data)
                completion(.success(responseData))
            } catch {
                completion(.failure(.parse))
            }
        }.resume()
    }
}
