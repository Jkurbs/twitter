//
//  Color.swift
//  Twitter
//
//  Created by Kerby Jean on 7/19/22.
//

import SwiftUI

// Color schemes reference
/*
 https://usbrandcolors.com/twitter-colors/
*/

extension Color {
    static let theme = ColorTheme()
}

class ColorTheme {
    let primary = Color("Primary")
    let secondary = Color("Secondary")
    let label = Color("Label")
    let secondaryLabel = Color("SecondaryLabel")
    let quaternaryLabel = Color("QuaternaryLabel")
    let placeholderText = Color("placeholderText")
}

