//
//  CoinDetailsView.swift
//  Crypto
//
//  Created by Bartosz Pawełczyk on 10/11/2022.
//

import SwiftUI

struct CoinDetailsView: View {
    let coin: Coin
    
    @State var buttonTitle = "Add to favorites"
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                VStack(alignment: .leading) {
                    Text(coin.symbol)
                        .font(.title2)
                    Text(coin.name)
                        .font(.caption)
                        .fontWeight(.bold)
                    Text(coin.quote.usd.formattedPrice)
                        .font(.caption)
                        .foregroundColor(.gray)
                    Divider()
                    Text("Last updated: \(coin.formattedDate)")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .padding()
                Button(buttonTitle) {
                    manageFavoriteCoin()
                }
            }
            .padding()
        }
        .navigationTitle(coin.name)
        .onAppear {
            handleButtonTitle()
        }
    }
    
    private func manageFavoriteCoin() {
        if FavoritesViewModel.isFavorite(coin: coin)  {
            FavoritesViewModel.removeFromFavorites(coin: coin)
        } else {
            FavoritesViewModel.saveToFavorites(coin: coin)
        }
        handleButtonTitle()
    }
    
    private func handleButtonTitle() {
        if FavoritesViewModel.isFavorite(coin: coin)  {
            buttonTitle = "Remove from favorites"
        } else {
            buttonTitle = "Add to favorites"
        }
    }
}

struct CoinDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CoinDetailsView(coin: .mock())
    }
}
