//
//  AllCoinsView.swift
//  Crypto
//
//  Created by Bartosz Pawełczyk on 09/11/2022.
//

import SwiftUI

struct AllCoinsView: View {
    @StateObject var viewModel: CryptoViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("All coins")
                .font(.headline)
                .padding()
            HStack {
                Text("Coins")
                Spacer()
                Button("Price") {
                    viewModel.reverseCoins()
                }
                
            }.padding(.horizontal)
                .font(.caption)
                .foregroundColor(.gray)
            ScrollView {
                VStack {
                    ForEach(viewModel.filteredCoins, id: \.id) { coin in
                        NavigationLink {
                            CoinDetailsView(coin: coin)
                        } label: {
                            AllCoinsItemView(coin: coin)
                        }
                        Divider()
                    }
                }
            }
        }
    }
}

//struct AllCoinsView_Previews: PreviewProvider {
//    static var previews: some View {
//        AllCoinsView(viewModel: .init())
//    }
//}
