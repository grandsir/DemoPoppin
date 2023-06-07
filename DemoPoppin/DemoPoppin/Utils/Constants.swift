//
//  Constants.swift
//  DemoPoppin
//
//  Created by Demirhan Mehmet Atabey on 8.06.2023.
//  Created at 00:11

import Foundation

struct Constants {
    static let partyNames = [
        "Neon Night Fever",
        "Enchanted Garden Gala",
        "Electric Dance Extravaganza",
        "Masquerade Madness",
        "Tropical Paradise Fiesta",
        "Starry Night Soirée",
        "Retro Rewind Bash",
        "Carnival Carnage",
        "Moonlit Masquerade Ball",
        "Beach Bonanza Bash"
    ]
    
    static let tags: [Tag] = [
        .init(name: "Free Pizza", color: 0xC3413B),
        .init(name: "Night Party", color: 0x2F2F5D),
        .init(name: "Free Beverages", color: 0x74D13F),
        .init(name: "Pool Party 🌊", color: 0x4A8DB5)
    ]
    
    // I force unwrap these because I know every URL is correct
    static let images : [URL] = [
        URL(string: "https://wallpapercave.com/wp/wp9077658.jpg")!,
        URL(string: "https://wallpapercave.com/wp/wp9077851.jpg")!,
        URL(string: "https://www.pixel4k.com/wp-content/uploads/2021/01/firewatch-sunrise-minimal-4k_1610662135.jpg.webp")!,
        URL(string: "https://static.vecteezy.com/system/resources/previews/000/247/824/large_2x/vector-beautiful-landscape-illustration.jpg")!,
    ]
}
