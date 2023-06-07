//
//  PartyViewModel.swift
//  DemoPoppin
//
//  Created by Demirhan Mehmet Atabey on 8.06.2023.
//  Created at 00:18

import Foundation

class PartyViewModel: ObservableObject {
    @Published var selectedTag: Tag?
    @Published var parties = [Party]()
    
    init() {
        self.parties = Utils.createRandomParties(count: 3)
    }
    
    
    func addParty() {
        self.parties.append(contentsOf: Utils.createRandomParties())
    }
}
