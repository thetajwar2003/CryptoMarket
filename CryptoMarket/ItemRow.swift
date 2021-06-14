//
//  ItemRow.swift
//  CryptoMarket
//
//  Created by Tajwar Rahman on 6/12/21.
//

import SwiftUI

struct ItemRow: View {
    let coin: SingleCoinList
    var body: some View {
        let price = String(format: "%.2f", coin.quote.USD.price)
        let positive = coin.quote.USD.percent_change_1h > 0
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(color: Color.gray, radius: 3, x: 3, y: 3)
            NavigationLink(destination: CoinDetail(coin: coin)) {
                HStack{
                    HStack {
                        URLImage(url: "https://s2.coinmarketcap.com/static/img/coins/64x64/\(coin.id).png").frame(width: 24, height: 24, alignment: .leading)
                        VStack(alignment: .leading) {
                            Text(coin.name)
                                .fontWeight(.bold)
                            Text(coin.symbol)
                                .foregroundColor(.secondary)
                                .font(.caption)
                        }
                    
                    }
                    Spacer()
                    Triangle()
                        .fill(positive ? Color.green : Color.red)
                        .frame(width: 10, height: 10)
                        .rotationEffect(positive ? .degrees(0) : .degrees(180))
                    Text("$\(price)")
                        .frame(height: 3, alignment: .trailing)
                        .foregroundColor(positive ? Color.green : Color.red)
                }
                .padding(10)
            }.padding(.trailing, 10)
        }
    }
}
