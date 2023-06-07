//
//  PartyTagSelectionView.swift
//  DemoPoppin
//
//  Created by Demirhan Mehmet Atabey on 8.06.2023.
//  Created at 01:15

import SwiftUI

// I finished the app early (around 1.2 hr), so I tried a cool component like this (is not included in actual design, because it was not suitable for it), but please check it in the Previews
struct PartyTagSelectionView: View {
    @EnvironmentObject var viewModel: PartyViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false)  {
            HStack {
                ForEach(Tag.exampleTags) { tag in
                    HStack {
                        Button {
                            if viewModel.selectedTag == tag {
                                viewModel.selectedTag = nil
                            }
                            else {
                                viewModel.selectedTag = tag
                            }
                        } label: {
                            ZStack {
                                if viewModel.selectedTag == tag {
                                    RoundedRectangle(cornerRadius: 20)
                                        .foregroundColor(Color(hex: tag.color))
                                        .padding(.vertical, 2)
                                        .frame(height: 35)
                                }
                                else {
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(lineWidth: 2)
                                        .foregroundColor(Color(hex: tag.color))
                                        .padding(.vertical, 2)
                                        .frame(height: 35)
                                }
                                
                                HStack {
                                    Circle()
                                        .foregroundColor(
                                            viewModel.selectedTag == tag ? Color(.systemBackground) : Color(hex: tag.color)
                                        )
                                        .frame(width: 10, height: 10)
                                    Text(tag.name)
                                        .font(.system(size: 15))
                                        .foregroundColor(
                                            viewModel.selectedTag == tag ? Color(.systemBackground) : Color.primary
                                        )
                                }
                                .foregroundColor(
                                    viewModel.selectedTag == tag ? Color(.systemBackground) : Color.primary
                                )

                                .padding(.horizontal)
                            }
                        }
                    }
                }
            }
            .padding(.leading)
        }
        .padding(.bottom)
    }
}

struct PartyTagSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        PartyTagSelectionView()
            .environmentObject(PartyViewModel())
    }
}
