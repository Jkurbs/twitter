//
//  View.swift
//  Twitter
//
//  Created by Kerby Jean on 7/22/22.
//

import SwiftUI
import Foundation

extension View {
    
    /// Alert with the provided error and button title.
    ///
    /// - Parameters:
    ///   - error: This binding is used to read out the error, as well as to set the error back to nil so the alert dismiss.
    ///   - buttonTitle: To set the title of the button.
    ///
    /// - Returns: An alert view.
    ///
    func errorAlert(error: Binding<Error?>, buttonTitle: String = "OK") -> some View {
        let localizedAlertError = LocalizedAlertError(error: error.wrappedValue)
        return alert(isPresented: .constant(localizedAlertError != nil), error: localizedAlertError) { _ in
            Button(buttonTitle) {
                error.wrappedValue = nil
            }
        } message: { error in
            Text(error.recoverySuggestion ?? "")
        }
    }
}
