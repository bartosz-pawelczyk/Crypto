//
//  RecentCoinsItemView.swift
//  Crypto
//
//  Created by Bartosz Pawełczyk on 09/11/2022.
//

import SwiftUI

struct RecentCoinsItemView: View {
    let coin: Coin

    var body: some View {
        VStack(alignment: .center) {
            Text(coin.symbol)
                .font(.title2)
            Text(coin.name)
                .font(.caption)
                .fontWeight(.bold)
            Text(coin.quote.usd.formattedPrice)
                .font(.caption)
                .foregroundColor(.gray)
        }
        .frame(width: 140, height: 140)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(.gray, lineWidth: 2)
        )
        .padding(.all, 2)
        .foregroundColor(.teal)
    }
}

//struct RecentCoinsItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        RecentCoinsItemView(coin: .mock())
//    }
//}
