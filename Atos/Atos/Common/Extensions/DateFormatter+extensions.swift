//  DateFormatter+extensions.swift
//  Created by Krzysztof Lech on 29/12/2022.

import Foundation

extension DateFormatter {
    internal static let atosDate: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
}
