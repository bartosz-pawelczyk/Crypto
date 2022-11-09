//
//  CryptoView.swift
//  Crypto
//
//  Created by Bartosz Pawełczyk on 09/11/2022.
//

import SwiftUI

struct CryptoView: View {
    @StateObject var cryptoViewModel: CryptoViewModel
    @StateObject var favoritesViewModel: FavoritesViewModel
    @Environment(\.isSearching) var isSearching

    var body: some View {
        TabView {
            Group {
                cryptoView
                    .tabItem {
                        Label("Menu",
                              systemImage: "dollarsign.circle")
                    }
                favoritesView
                    .tabItem {
                        Label("Favorites",
                              systemImage: "star")
                    }
            }
            .toolbar(.visible, for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
        }
        .accentColor(.teal)
    }
}

private extension CryptoView {
    
    var cryptoView: some View {
        NavigationView {
            if cryptoViewModel.isLoading {
                ActivityIndicator()
                    .frame(width: 80, height: 80)
                    .padding()
            } else {
                ScrollView(.vertical) {
                    Divider()
                    Spacer(minLength: 16)
                    RecentCoinsView(viewModel: cryptoViewModel)
                    Divider()
                    AllCoinsView(viewModel: cryptoViewModel)
                }
                .searchable(text: $cryptoViewModel.searchText)
                .navigationTitle(cryptoViewModel.navigationTitle)
            }
        }
        .onAppear {
            cryptoViewModel.fetchData()
        }
        .refreshable {
            cryptoViewModel.fetchData(forcePull: true)
        }
    }
    
    var favoritesView: some View {
        FavoritesView(viewModel: favoritesViewModel)
    }
}

struct CryptoView_Previews: PreviewProvider {
    static var previews: some View {
        CryptoView(cryptoViewModel: .init(),
                   favoritesViewModel: .init())
    }
}
