//
//  FavoritesViewModel.swift
//  Crypto
//
//  Created by Bartosz Pawełczyk on 10/11/2022.
//

import SwiftUI

final class FavoritesViewModel: ObservableObject {
    let navigationTitle = "Favorites"
    
    @Published var favorites = [Coin]()

    private enum Constants {
        static let favoritesUDKey = "favorites"
    }
    
    func fetchFavorites() {
        favorites = FavoritesViewModel.getFavorites()
    }
    
    static func saveToFavorites(coin: Coin) {
        var favorites = getFavorites()
        guard !favorites.contains(where: { $0.id == coin.id }) else { return }
        favorites.append(coin)
        if let encoded = try? JSONEncoder().encode(favorites) {
            UserDefaults.standard.setValue(encoded, forKey: Constants.favoritesUDKey)
        }
    }
    
    static func removeFromFavorites(coin: Coin) {
        var favorites = getFavorites()
        favorites = favorites.filter { $0.id != coin.id }
        if let encoded = try? JSONEncoder().encode(favorites) {
            UserDefaults.standard.setValue(encoded, forKey: Constants.favoritesUDKey)
        }
    }
    
    static func getFavorites() -> [Coin] {
        if let data = UserDefaults.standard.object(forKey: Constants.favoritesUDKey) as? Data,
           let favorites = try? JSONDecoder().decode([Coin].self, from: data) {
             return favorites
        }
        return []
    }
    
    static func isFavorite(coin: Coin) -> Bool {
        return FavoritesViewModel.getFavorites().contains(where: { $0.id == coin.id })
    }
}
