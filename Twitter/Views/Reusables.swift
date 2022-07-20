//
//  Reusables.swift
//  Twitter
//
//  Created by Kerby Jean on 7/19/22.
//

import SwiftUI

/// Separator with color parameter.
///
/// - Parameters:
///   - color: The color of the separator .
///
/// - Returns: A Separator view of the given color.
///
@ViewBuilder func Separator(color: Color) -> some View {
    Rectangle()
        .frame(maxWidth: .infinity, maxHeight: 0.5)
        .foregroundColor(color)
}

/// Black button with title parameter.
///
/// - Parameters:
///   - title: The title of the button.
///   - isLoading: Wheter or not the button is loading
///
/// - Returns: A Button view with a title.
///
@ViewBuilder func BlackButton(title: String, isLoading: Bool = false) -> some View {
    ZStack(alignment: .center) {
        Text(isLoading ? "" : title)
            .foregroundColor(Color.theme.quaternaryLabel)
            .fontWeight(.bold)
            .frame(width: 300, height: 60, alignment: .center)
            .background(Color.black)
            .cornerRadius(30)
        if isLoading {
            ProgressView()
                .tint(.white)
        }
    }
}

/// BottomBorderTextField with placehorder and value parameters.
///
/// - Parameters:
///   - placeholder: The placeholder of the Textfield.
///   - value: The value of the TextField
///
/// - Returns: A textfield with custom place holder and value.
///
@ViewBuilder func BottomBorderTextField(placeholder: String, value: Binding<String>, isSecure: Bool = false) -> some View {
    VStack {
        if isSecure {
            SecureField(placeholder, text: value)
                .textFieldStyle(.plain)
                .frame(maxHeight: 55)
                .disableAutocorrection(true)
        } else {
            TextField(placeholder, text: value)
                .textFieldStyle(.plain)
                .frame(maxHeight: 55)
                .disableAutocorrection(true)
        }
        
        Separator(color: Color.theme.label)
    }
    .frame(height: 60)
}



