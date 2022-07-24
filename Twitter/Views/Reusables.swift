//
//  Reusables.swift
//  Twitter
//
//  Created by Kerby Jean on 7/19/22.
//

import SwiftUI

/// Creates a separator with the provided color.
///
/// - Parameters:
///   - color: The color of the separator.
///
@ViewBuilder func Separator(color: Color) -> some View {
    Rectangle()
        .foregroundColor(color)
        .frame(maxWidth: .infinity, maxHeight: 0.5)
}

/// Creates a black button with the provided title.
///
/// - Parameters:
///   - title: The title of the button.
///   - startLoading: Sets title to empty string and adds progressView to button.
///
@ViewBuilder func BlackButton(title: String, startLoading: Bool = false) -> some View {
    ZStack(alignment: .center) {
        Text(startLoading ? "" : title)
            .foregroundColor(Color.theme.quaternaryLabel)
            .fontWeight(.bold)
            .frame(width: 300, height: 60, alignment: .center)
            .background(Color.black)
            .cornerRadius(30)
        if startLoading {
            ProgressView()
                .tint(.white)
        }
    }
    .accessibility(addTraits: .isButton)
    .accessibilityIdentifier("logIn")
}

/// Creates a  TextField with border bottom with the provided placehorder and value.
///
/// - Parameters:
///   - placeholder:The placeholder of the Textfield.
///   - value: The value of the TextField.
///
@ViewBuilder func BorderBottomTextField(placeholder: String, value: Binding<String>, isSecure: Bool = false) -> some View {
    VStack {
        if isSecure {
            SecureField(placeholder, text: value)
        } else {
            TextField(placeholder, text: value)
                
        }
        Separator(color: Color.theme.label)
    }
    .accessibilityIdentifier(placeholder)
    .textFieldStyle(.plain)
    .disableAutocorrection(false)
    .textInputAutocapitalization(.never)
    .frame(maxHeight: 60)
}



