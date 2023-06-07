//
//  Tag.swift
//  DemoPoppin
//
//  Created by Demirhan Mehmet Atabey on 8.06.2023.
//  Created at 01:10

import Foundation

struct Tag: Codable, Identifiable, Equatable, Hashable {
    var id = UUID()
    var name: String
    var color: UInt
    
    static var exampleTags: [Tag] = [
        .init(name: "Free Pizza", color: 0xC3413B),
        .init(name: "Night Party", color: 0x2F2F5D),
        .init(name: "Free Beverages", color: 0x74D13F),
        .init(name: "Pool Party 🌊", color: 0x4A8DB5)
    ]
}
