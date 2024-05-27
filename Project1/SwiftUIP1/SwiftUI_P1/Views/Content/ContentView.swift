//
//  ContentView.swift
//  SwiftUI_P1
//
//  Created by Irinka Datoshvili on 22.05.24.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    @ObservedObject var viewModel = ContentViewModel()
    let items: [ListItemData] = sampleItems
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            // MARK: - Title
            Text("Svibti Iuai Eksersaisi")
                .font(.system(size: 34, weight: .bold))
                .foregroundColor(.white)
                .padding(EdgeInsets(top: 22, leading: 18, bottom: 0, trailing: 0))
            
            HStack(spacing: 13) {
                
                // MARK: - SongView and ChatView Stack
                SongView()
                VStack(spacing: 10) {
                    ChatView()
                    NewsView()
                }
            }
            .padding(EdgeInsets(top: 7, leading: 12, bottom: 28, trailing: 23))
            
            // MARK: - List
            List {
                Section {
                    ForEach(items, id: \.title) { item in
                        ListItemView(data: item)
                            .alignmentGuide(.listRowSeparatorLeading) { _ in
                                0
                            }
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 15, trailing: 0))
                            .listRowSeparatorTint(.gray)
                    }
                    .listRowBackground(Color.clear)
                }
                .listSectionSeparator(.hidden, edges: .all)
            }
            .listStyle(.plain)
        }
        
        // MARK: - Arrow Button Overlay
        .overlay(
            Button(action: {
                viewModel.toggleIconColor()
            }) {
                Image("arrow")
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                    .background(Color(viewModel.backgroundColor))
                    .clipShape(Circle())
                    .padding(.trailing, 10)
            },
            alignment: .bottomTrailing
        )
        .background(Color(red: 25/255, green: 37/255, blue: 43/255))
    }
}

#Preview {
    ContentView()
}
