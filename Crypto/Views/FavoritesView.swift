//
//  FavoritesView.swift
//  Crypto
//
//  Created by Bartosz Pawełczyk on 10/11/2022.
//

import SwiftUI

struct FavoritesView: View {
    @StateObject var viewModel: FavoritesViewModel
    
    var body: some View {
        NavigationView {
            listView
                .navigationTitle(viewModel.navigationTitle)
        }
        .onAppear {
            viewModel.fetchFavorites()
        }
    }
    
    var emptyListView: some View {
        Text("Oops, loos like there's no data...")
    }
    
    @ViewBuilder
    var listView: some View {
        if viewModel.favorites.isEmpty {
            emptyListView
        } else {
            List(viewModel.favorites, id: \.id) { coin in
                HStack {
                    Image(systemName: "star")
                        .renderingMode(.template)
                        .foregroundColor(.teal)
                    Text(coin.name)
                }
            }
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView(viewModel: .init())
    }
}
