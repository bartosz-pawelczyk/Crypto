//
//  AllCoinsItemView.swift
//  Crypto
//
//  Created by Bartosz Pawełczyk on 09/11/2022.
//

import SwiftUI

struct AllCoinsItemView: View {
    let coin: Coin

    var body: some View {
        HStack(spacing: 8) {
            Text(coin.symbol)
                .font(.caption)
                .foregroundColor(.gray)
                .frame(maxWidth: 40)
            Text(coin.name)
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding(.leading, 4)
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 4) {
                Text("USD")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)
                
                Text(coin.quote.usd.formattedPrice)
                    .font(.caption)
                    .padding(.leading, 6)
                    .foregroundColor(.red)
                
            }
            .padding(.leading, 2)
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
        .foregroundColor(.black)
    }
}

//struct CoinRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        AllCoinsItemView(coin: .mock())
//    }
//}
