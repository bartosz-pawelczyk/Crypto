//
//  RecentCoinsView.swift
//  Crypto
//
//  Created by Bartosz Pawełczyk on 09/11/2022.
//

import SwiftUI

struct RecentCoinsView: View {
    @StateObject var viewModel: CryptoViewModel

    var body: some View {
        VStack(alignment: .leading) {
            Text("Recent coins updates")
                .font(.callout)
                .padding(.leading, 8)
            ScrollView(.horizontal) {
               HStack {
                   ForEach(viewModel.recentCoins, id: \.id) { coin in
                       NavigationLink {
                           CoinDetailsView(coin: coin)
                       } label: {
                           RecentCoinsItemView(coin: coin)
                               .foregroundColor(.teal)
                       }
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
        .padding([.leading, .trailing], 8)
    }
}

//struct RecentCoinsView_Previews: PreviewProvider {
//    static var previews: some View {
//        RecentCoinsView(viewModel: .init())
//    }
//}
