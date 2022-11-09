//
//  CryptoApp.swift
//  Crypto
//
//  Created by Bartosz Pawełczyk on 09/11/2022.
//

import SwiftUI

@main
struct CryptoApp: App {
    var body: some Scene {
        WindowGroup {
            CryptoView(cryptoViewModel: .init(), favoritesViewModel: .init())
        }
    }
}
