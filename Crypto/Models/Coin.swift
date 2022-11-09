//
//  Coin.swift
//  Crypto
//
//  Created by Bartosz Pawełczyk on 09/11/2022.
//

import Foundation

struct Coin: Codable {
    let id: Int
    let name, symbol, slug: String
    let numMarketPairs: Int
    let dateAdded: String
    let tags: [String]
    let maxSupply: Double?
    let circulatingSupply, totalSupply: Double
    let platform: Platform?
    let cmcRank: Int
    let selfReportedCirculatingSupply, selfReportedMarketCap, tvlRatio: Double?
    let lastUpdated: String
    let quote: Quote

    enum CodingKeys: String, CodingKey {
        case id, name, symbol, slug
        case numMarketPairs = "num_market_pairs"
        case dateAdded = "date_added"
        case tags
        case maxSupply = "max_supply"
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        case platform
        case cmcRank = "cmc_rank"
        case selfReportedCirculatingSupply = "self_reported_circulating_supply"
        case selfReportedMarketCap = "self_reported_market_cap"
        case tvlRatio = "tvl_ratio"
        case lastUpdated = "last_updated"
        case quote
    }
}

extension Coin {
    
    var formattedDate: String {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [
            .withFractionalSeconds,
            .withFullDate,
            .withTime,
            .withColonSeparatorInTime,
            .withDashSeparatorInDate
        ]
        let date = formatter.date(from: lastUpdated)
        return date?.formatted() ?? "-"
    }
}

extension Coin {

    static func mock() -> Coin {
        Coin(id: 1,
             name: "name",
             symbol: "symbol",
             slug: "slug",
             numMarketPairs: 1,
             dateAdded: "dateAdded",
             tags: ["tag"],
             maxSupply: 10.0,
             circulatingSupply: 1,
             totalSupply: 2,
             platform: .mock(),
             cmcRank: 321,
             selfReportedCirculatingSupply: 54.12,
             selfReportedMarketCap: 75.21,
             tvlRatio: 754.4,
             lastUpdated: "2022-11-09T20:37:00.000Z",
             quote: .mock())
    }
}
