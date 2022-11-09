//
//  CryptoViewModel.swift
//  Crypto
//
//  Created by Bartosz Pawełczyk on 09/11/2022.
//

import Combine
import SwiftUI

final class CryptoViewModel: ObservableObject {
    let navigationTitle = "Crypto"
    
    private enum Constants {
        static let apiURL = URL(string: "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest")
        static let apiKey = "b417aeef-d5be-4955-82c6-6722c56453a0"
        static let apiKeyHeader = "X-CMC_PRO_API_KEY"
    }
    
    @Published var filteredCoins = [Coin]()
    @Published var recentCoins = [Coin]()
    @Published var searchText = ""
    @Published var isLoading: Bool = false
    
    private var coins = [Coin]() {
        didSet {
            setupCoins()
        }
    }
    
    private var searchCancellable: AnyCancellable?

    enum NetworkError: Error {
        case badURL
        case requestError
        case noData
        case custom(Error)
        case decodingError
    }
    
    init() {
        searchCancellable = $searchText.sink { [weak self] _ in
            self?.setupCoins()
        }
    }

    func fetchData(forcePull: Bool = false) {
        let shouldFetchData = coins.isEmpty || forcePull
        guard shouldFetchData else { return }
        isLoading = true
        getDataRequest { [weak self] (result) in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let coins):
                    self?.coins = coins
                    self?.configureRecentCoins()
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    func reverseCoins() {
        filteredCoins = filteredCoins.reversed()
    }
}

private extension CryptoViewModel {
    
    func setupCoins() {
        guard !searchText.isEmpty else {
            filteredCoins = coins
            return
        }
        filteredCoins = coins.filter { $0.name.contains(searchText) }
    }

    func getDataRequest(completion: @escaping (Result<[Coin],NetworkError>)-> Void) {
        guard let url = Constants.apiURL else {
            completion(.failure(.badURL))
            return }

        var request = URLRequest(url: url)
        request.setValue(Constants.apiKey, forHTTPHeaderField: Constants.apiKeyHeader)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(.custom(error)))

            }
            else if (response as? HTTPURLResponse)?.statusCode != 200 {
                completion(.failure(.requestError))
            }

            guard let data = data else {
                completion(.failure(.noData))
                return }

            do {
                let coinsData = try JSONDecoder().decode(CoinsData.self, from: data)
//                print("Debug coins: \(coinsData)")
                completion(.success(coinsData.data.sorted { $0.quote.usd.price > $1.quote.usd.price }))
            } catch {
                print("Decoding error specific: \(error)")
                completion(.failure(.decodingError))
            }

        }.resume()
    }

    func configureRecentCoins() {
        let recentCoins = coins.sorted { $0.lastUpdated > $1.lastUpdated }
        self.recentCoins = Array(recentCoins.prefix(5))
    }
}
