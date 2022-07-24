//
//  LocalizedError.swift
//  Twitter
//
//  Created by Kerby Jean on 7/22/22.
//

import Foundation

struct LocalizedAlertError: LocalizedError {
    
    let underlyingError: LocalizedError
    var errorDescription: String? {
        underlyingError.errorDescription
    }
    var recoverySuggestion: String? {
        underlyingError.recoverySuggestion
    }

    init?(error: Error?) {
        guard let localizedError = error else { return nil }
        underlyingError = localizedError
    }
}
