//
//  Date+Helpers.swift
//  DemoPoppin
//
//  Created by Demirhan Mehmet Atabey on 8.06.2023.
//  Created at 00:32

import Foundation

extension Date {
    var ddmmyyyyFormatWithHour : String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy h.mm a"
        let dateString = dateFormatter.string(from: self)
        return dateString
    }
}
