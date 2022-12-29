//  NetworkingError.swift
//  Created by Krzysztof Lech on 29/12/2022.

import Foundation

enum NetworkingError: String, Error {
    case url = "Wrong url format"
    case noInternet = "No Internet"
    case network = "Failed to fetch data"
    case statusCode = "Response Status Code is not OK"
    case other = "Fetched data problem"
    case parse = "Parse data problem"
}
