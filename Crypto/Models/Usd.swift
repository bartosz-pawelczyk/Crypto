//
//  Usd.swift
//  Crypto
//
//  Created by Bartosz Pawełczyk on 09/11/2022.
//

import Foundation

struct Usd: Codable {
    let price, volume24H, volumeChange24H, percentChange1H: Double
    let percentChange24H, percentChange7D, percentChange30D, percentChange60D: Double
    let percentChange90D, marketCap, marketCapDominance, fullyDilutedMarketCap: Double
    let tvl: Double?
    let lastUpdated: String

    enum CodingKeys: String, CodingKey {
        case price
        case volume24H = "volume_24h"
        case volumeChange24H = "volume_change_24h"
        case percentChange1H = "percent_change_1h"
        case percentChange24H = "percent_change_24h"
        case percentChange7D = "percent_change_7d"
        case percentChange30D = "percent_change_30d"
        case percentChange60D = "percent_change_60d"
        case percentChange90D = "percent_change_90d"
        case marketCap = "market_cap"
        case marketCapDominance = "market_cap_dominance"
        case fullyDilutedMarketCap = "fully_diluted_market_cap"
        case tvl
        case lastUpdated = "last_updated"
    }
}

extension Usd {

    var formattedPrice: String {
        return String(format: "%.2f$", price * 4.57)
    }
}

extension Usd {

    static func mock() -> Usd {
        Usd(price: 12.32,
            volume24H: 24.2,
            volumeChange24H: 123.2,
            percentChange1H: 123,
            percentChange24H: 123.2,
            percentChange7D: 123.2,
            percentChange30D: 123.2,
            percentChange60D: 123.2,
            percentChange90D: 123.2,
            marketCap: 123.2,
            marketCapDominance: 123.2,
            fullyDilutedMarketCap: 123.2,
            tvl: 123.2,
            lastUpdated: "2022-11-09T20:37:00.000Z")
    }
}
