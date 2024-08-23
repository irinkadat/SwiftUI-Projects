//
//  SearchPageView.swift
//  Watcher
//
//  Created by Irinka Datoshvili on 05.06.24.
//

import SwiftUI

struct SearchPageView: View {
    @StateObject var viewModel = SearchViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                searchBar
                    .padding(.top, 20)
                searchResults
                Spacer()
            }
            .background(.customBackground)
            .navigationTitle("Search")
        }
        .background(.customBackground)
    }
    
    // MARK: - Search Bar
    private var searchBar: some View {
        HStack {
            HStack {
                TextField("try Spiderman :)", text: $viewModel.query)
                    .autocapitalization(.none)
                Image("search")
                    .foregroundColor(.gray)
                    .onTapGesture {
                        viewModel.searchMovies()
                    }
            }
            .padding()
            .frame(height: 42)
            .background(.searchBackground)
            .cornerRadius(16)
            .padding(.leading, 20)
            .padding(.trailing, 10)
            
            menuPicker
        }
        .onChange(of: viewModel.selectedCriteria) {
            viewModel.query = ""
        }
        .onSubmit {
            viewModel.searchMovies()
        }
    }
    
    // MARK: - Menu picker
    private var menuPicker: some View {
        Menu {
            Picker("Select Criteria", selection: $viewModel.selectedCriteria) {
                Text("Name").tag("Name")
                Text("Genre").tag("Genre")
                Text("Year").tag("Year")
            }
        } label: {
            Image("searchMenuIcon")
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25)
                .padding(.trailing, 26)
        }
    }
    
    // MARK: - Search Results
    @ViewBuilder
    private var searchResults: some View {
        if viewModel.isSearchPerformed {
            if viewModel.filteredMovies.isEmpty && !viewModel.hasResults {
                promptView(title: "Oh No Isn’t This So Embarrassing?", message: "I cannot find any movie with this name.")
            } else {
                resultsList
            }
        } else {
            promptView(title: "Use The Magic Search!", message: "I will do my best to search everything relevant, I promise!")
        }
    }
    
    // MARK: - Reusable Prompt View
    private func promptView(title: String, message: String) -> some View {
        VStack() {
            Spacer(minLength: 257)
            Text(title)
                .font(.custom("Montserrat-medium", size: 16))
                .padding()
            Text(message)
                .font(.custom("Montserrat-medium", size: 12))
                .foregroundStyle(Color("TextColor"))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 61)
                .lineLimit(2)
            Spacer()
        }
    }
    
    // MARK: - Results List
    private var resultsList: some View {
        List(viewModel.filteredMovies, id: \.id) { movie in
            VStack() {
                MovieCell(movie: movie)
            }
            .listRowSeparator(.hidden)
            .listRowBackground(Color.clear)
        }
        .listStyle(PlainListStyle())
        .background(.customBackground)
        .padding(.leading, -8)
    }
}

// MARK: - Preview
#Preview {
    SearchPageView()
}
