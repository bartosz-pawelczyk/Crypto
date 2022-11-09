//
//  Quote.swift
//  Crypto
//
//  Created by Bartosz Pawełczyk on 09/11/2022.
//

import Foundation

struct Quote: Codable {
    let usd: Usd

    enum CodingKeys: String, CodingKey {
        case usd = "USD"
    }
}

extension Quote {

    static func mock() -> Quote {
        Quote(usd: .mock())
    }
}
