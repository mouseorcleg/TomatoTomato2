//
//  Color.swift
//  TomatoTomato2
//
//  Created by Maria Kharybina on 06/01/2023.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
}

struct ColorTheme {
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let extra = Color("ExtraColor")
    let appBackground = Color("AppBackgroundColor")
}
