//
//  Color+Helpers.swift
//  DemoPoppin
//
//  Created by Demirhan Mehmet Atabey on 8.06.2023.
//  Created at 00:24

import SwiftUI

// Taken from https://stackoverflow.com/a/56894458/14865215
extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}
