//
//  CoinsData.swift
//  Crypto
//
//  Created by Bartosz Pawełczyk on 09/11/2022.
//

import Foundation

struct CoinsData: Codable {
    let data: [Coin]
}


extension CoinsData {

    static func mock() -> CoinsData {
        CoinsData(data: [.mock()])
    }
}
