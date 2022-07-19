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
///
/// - Returns: A Button view of the given title.
///
@ViewBuilder func BlackButton(title: String) -> some View {
    Button {
    } label: {
        Text(title)
            .foregroundColor(Color.theme.quaternaryLabel)
            .fontWeight(.bold)
    }
    .frame(width: 300, height: 60, alignment: .center)
    .background(Color.black)
    .cornerRadius(30)
}

/// BottomBorderTextField with placehorder and value parameters.
///
/// - Parameters:
///   - placeholder: The placeholder of the Textfield.
///   - value: The value of the TextField
///
/// - Returns: A textfield with custom place holder and value.
///
@ViewBuilder func BottomBorderTextField(placeholder: String, value: Binding<String>) -> some View {
    VStack {
        TextField(placeholder, text: value)
            .textFieldStyle(.plain)
            .frame(maxHeight: 55)
        Separator(color: Color.theme.label)
    }
    .frame(height: 60)
}



