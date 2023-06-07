//
//  HomeView.swift
//  DemoPoppin
//
//  Created by Demirhan Mehmet Atabey on 8.06.2023.
//  Created at 00:17

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = PartyViewModel()
    
    var body: some View {
        NavigationView {
            PartyCardsView()
                .navigationTitle("Let's Party!")
        }
        .environmentObject(viewModel)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
