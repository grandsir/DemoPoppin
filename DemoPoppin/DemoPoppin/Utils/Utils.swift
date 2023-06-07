//
//  Utils.swift
//  DemoPoppin
//
//  Created by Demirhan Mehmet Atabey on 8.06.2023.
//  Created at 00:14

import Foundation


import Foundation

// I'm Creating it inside of the Utils instead of PartyViewModel because it can be reused in different screens
struct Utils {
    static func createRandomParties(count: Int = 1) -> [Party] {
        var parties = [Party]()
        
        for _ in 0..<count {
            let randomName = Constants.partyNames.randomElement()!
            let randomPrice = Double.random(in: 0..<100)
            let randomImage = Constants.images.randomElement()!
            let randomDates = generateRandomDates()
            
            parties.append(
                Party(
                    name: randomName,
                    bannerImage: randomImage,
                    price: randomPrice,
                    startDate: randomDates.startDate,
                    endDate: randomDates.endDate
                )
            )
        }
        
        return parties
    }
    
    static func generateRandomDates() -> (startDate: Date, endDate: Date?) {
        let currentDate = Date()
        
        // the events will only be scheculed this year, that prevents creating crazy times like 10 years later
        let oneYear = 365 * 24 * 60 * 60 // one year in seconds
        
        let randomTimeInterval = TimeInterval(arc4random_uniform(UInt32(oneYear)))
        let randomStartDate = currentDate.addingTimeInterval(randomTimeInterval)
        let randomEndDate: Date?
        
        if arc4random_uniform(10) < 3 { // 30% chance of making endDate nil
            randomEndDate = nil
        } else {
            // upper limit 3 days max because it makes the most sense
            let maxDuration: TimeInterval = 3 * 24 * 60 * 60
            let randomEndInterval = TimeInterval(arc4random_uniform(UInt32(maxDuration)))
            randomEndDate = randomStartDate.addingTimeInterval(randomEndInterval)
        }
        
        return (randomStartDate, randomEndDate)
    }
}

