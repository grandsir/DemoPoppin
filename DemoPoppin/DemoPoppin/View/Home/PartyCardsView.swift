//
//  PartyCardsView.swift
//  DemoPoppin
//
//  Created by Demirhan Mehmet Atabey on 8.06.2023.
//  Created at 00:21

import SwiftUI

struct PartyCardsView: View {
    @EnvironmentObject var viewModel: PartyViewModel
    
    @State private var expandingPartyCard: Party? = nil
    @State private var searchText = ""
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            // Cards Stack
            VStack(spacing: 16) {
                ForEach(searchResults) { party in
                    // Price & Attend Button Stack
                    VStack(alignment: .leading, spacing: 0) {
                        // Bottom Dates Stack
                        ZStack(alignment: .bottomLeading) {
                            // Top Names Stack
                            ZStack(alignment: .topLeading) {
                                
                                // Note: I normally use NukeUI because it handles image caching (AsyncImage doesn't), but I don't want to use any 3rd parties in this assesment.
                                // MARK: Image
                                AsyncImage(url: party.bannerImage) { phase in
                                    switch phase {
                                    case .empty:
                                        ProgressView()


                                    case .failure(_):
                                        Color.black

                                    case .success(let image):
                                        image
                                            .resizable()
                                            .scaledToFill()

                                    @unknown default:
                                        fatalError()
                                    }
                                }
                                .frame(width: 350, height: expandingPartyCard == party ? 350 : 120)
                                .animation(.spring(response: 0.3, dampingFraction: 1.2), value: expandingPartyCard == party)

                                .overlay(
                                    Color.black.opacity(expandingPartyCard == party ? 0 : 0.4)
                                )
                                
                                // MARK: Name
                                HStack {
                                    Text(party.name)
                                        .font(.title2)
                                        .fontWeight(.semibold)
                                        .padding([.leading, .top], 14)
                                        .foregroundColor(.white)
                                        .zIndex(.greatestFiniteMagnitude)
                                        .opacity(expandingPartyCard == party ? 0 : 1)


                                    Spacer()
                                    Button {
                                        if expandingPartyCard == party {
                                            expandingPartyCard = nil
                                            return
                                        }
                                        expandingPartyCard = party
                                    } label: {
                                        Image(systemName: "chevron.down")
                                            .renderingMode(.template)
                                            .foregroundColor(Color(hex: Colors.appPrimaryColor))
                                            .rotationEffect(.degrees(expandingPartyCard == party ? 180 : 0))
                                            .animation(.spring(response: 0.2, dampingFraction: 1.2), value: expandingPartyCard == party)
                                    }
                                    .padding(.trailing)
                                }
                            }
                            
                            // MARK: Date
                            VStack(alignment: .leading, spacing: 2) {
                                HStack(spacing: 2) {
                                    Text("from:")
                                        .fontWeight(.medium)
                                        .font(.caption)

                                    Text(party.startDate.ddmmyyyyFormatWithHour)
                                        .font(.system(size: 13))
                                        .fontWeight(.medium)
                                }

                                HStack(spacing: 2) {
                                    Text("to:")
                                        .fontWeight(.medium)
                                        .font(.caption)

                                    Text(party.endDate?.ddmmyyyyFormatWithHour ?? "N/A")
                                        .font(.system(size: 13))
                                        .fontWeight(.medium)
                                }
                            }
                            .padding(.horizontal)
                            .padding(.bottom)
                            .foregroundColor(.white)
                            .opacity(expandingPartyCard == party ? 0 : 1)
                            
                        }
                        
                        
                        // MARK: Bottom Actions
                        HStack {
                            HStack(spacing: 2) {
                                Text("Price:")
                                    .fontWeight(.semibold)
                                Text("$\(String(format: "%2.f", party.price))")
                                    .fontWeight(.medium)
                                    .foregroundColor(Color(hex: Colors.appPrimaryTextColor))
                            }
                            .font(.system(size: 17))
                            
                            Spacer()
                            
                            joinButton
                        }
                        .foregroundColor(.primary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                        .padding(.vertical)
                        .background(Color(.systemGray6))
                    }
                }
                .frame(width: 350)
                .cornerRadius(16)
            }
            .padding(.top, 24)
            
            createPartyButton
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    viewModel.addParty()
                } label: {
                    Image(systemName: "plus")
                }
                .foregroundColor(Color(hex: Colors.appPrimaryTextColor))
            }
        }
        .searchable(text: $searchText)
    }
    
    var searchResults : [Party] {
        if searchText.isEmpty {
            return viewModel.parties
        }
        else {
            return viewModel.parties.filter { party in
                party.name.contains(searchText)
            }
        }
    }
    
    var joinButton: some View {
        Button {
            
        } label: {
            Text("Join")
                .font(.system(size: 15))
                .fontWeight(.medium)
                .foregroundColor(.white)
                .padding(.vertical, 8)
                .padding(.horizontal, 51)
                .background(Color(hex: Colors.appPrimaryColor))
                .clipShape(Capsule())
                .padding(.trailing)
        }
    }
    
    var createPartyButton: some View {
        Button {
            viewModel.addParty()
        } label: {
            Image(systemName: "plus")
                .resizable()
                .renderingMode(.template)
                .foregroundColor(.white)
                .scaledToFit()
                .frame(width: 24, height: 24)
                .frame(width: 350)
                .frame(height: 170)
                .background(Color(hex: Colors.appPrimaryColor))
                .cornerRadius(16)

        }

        
    }
}


struct PartyCardsView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
        // To test resposiveness
        HomeView()
            .previewDevice("iPhone SE (3rd generation)")
            .environmentObject(PartyViewModel())
    }
}
