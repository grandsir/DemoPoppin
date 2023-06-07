//
//  Party.swift
//  DemoPoppin
//
//  Created by Demirhan Mehmet Atabey on 8.06.2023.
//  Created at 00:19

import Foundation

struct Party: Codable, Equatable, Identifiable, Hashable {
    var id = UUID()
    
    let name: String
    let bannerImage: URL
    let price: Double
    let startDate: Date
    let endDate: Date?
//    let tags: [Tag]
}
