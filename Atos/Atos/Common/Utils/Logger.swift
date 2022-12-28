//  Logger.swift
//  Created by Krzysztof Lech on 28/12/2022.

import Foundation

internal struct Logger {
    static internal func log(info: String) {
        #if !DEBUG
            return
        #endif

        let prefix = "ℹ️"
        print(prefix, info)
    }

    static internal func log(okText: String) {
        #if !DEBUG
            return
        #endif

        let prefix = "🙂"
        print(prefix, okText)
    }

    static internal func log(error: String) {
        #if !DEBUG
            return
        #endif

        let prefix = "‼️"
        print(prefix, error)
    }
}
