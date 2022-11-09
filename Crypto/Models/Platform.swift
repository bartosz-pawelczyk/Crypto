//
//  Platform.swift
//  Crypto
//
//  Created by Bartosz Pawełczyk on 09/11/2022.
//

import Foundation

struct Platform: Codable {
    let id: Int
    let name, symbol, slug, tokenAddress: String

    enum CodingKeys: String, CodingKey {
        case id, name, symbol, slug
        case tokenAddress = "token_address"
    }
}

extension Platform {

    static func mock() -> Platform {
        Platform(id: 123,
                 name: "name",
                 symbol: "symbol",
                 slug: "slug",
                 tokenAddress: "tokenAddress")
    }
}
