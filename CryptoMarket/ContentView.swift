//
//  ContentView.swift
//  CryptoMarket
//
//  Created by Tajwar Rahman on 6/10/21.
//

import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))

        return path
    }
}

struct ContentView: View {
    @State var isActive:Bool = false
//    @State var coins: [SingleCoinList] = []
    @State var coins = coinData.sorted{
        $0.cmc_rank < $1.cmc_rank
    }
    var body: some View {
        NavigationView {
            if self.isActive{
                List(coins) { coin in
                    let price = String(format: "%.2f", coin.quote.USD.price)
                    let positive = coin.quote.USD.percent_change_1h > 0
                    HStack {
                        URLImage(url: "https://s2.coinmarketcap.com/static/img/coins/64x64/\(coin.id).png").frame(width: 24, height: 24, alignment: .leading)
                        VStack(alignment: .leading) {
                            Text(coin.name)
                                .fontWeight(.bold)
//                                    .padding(EdgeInsets(top: 13, leading: 0, bottom: 0, trailing: 0))
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
                .navigationBarTitle(Text("Crypto Market"))
//                .onAppear{
//                    API().getListings { (coin) in
//                        self.coins = coin.data
//                    }
//                }
            } else {
                ZStack{
                    Color(UIColor(red: 0/255, green: 72/255, blue: 203/255, alpha: 1)).edgesIgnoringSafeArea(.all)
                    Image("CryptoMarket")
                .resizable()
                }

            }
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation{
                    self.isActive = true
                }
            }
        }
    }
}

var coinData = [
    SingleCoinList(id: 1, name: "BitCoin", symbol: "BTC", slug: "bitcoin", cmc_rank: 1, last_updated: "2018-06-02T22:51:28.209Z", quote: Quote(USD: USD(price: 4324.2, percent_change_1h: 53425423.54, percent_change_24h: 4523542.45, percent_change_7d: 432234.23, market_cap: 5324543532.53))),
    SingleCoinList(id: 42, name: "fds", symbol: "BTC", slug: "bitcoin", cmc_rank: 4, last_updated: "2018-06-02T22:51:28.209Z", quote: Quote(USD: USD(price: 4324.2, percent_change_1h: -53425423.54, percent_change_24h: 4523542.45, percent_change_7d: 432234.23, market_cap: 5324543532.53))),
    SingleCoinList(id: 23, name: "qwe", symbol: "BTC", slug: "bitcoin", cmc_rank: 3, last_updated: "2018-06-02T22:51:28.209Z", quote: Quote(USD: USD(price: 4324.2, percent_change_1h: 53425423.54, percent_change_24h: 4523542.45, percent_change_7d: 432234.23, market_cap: 5324543532.53))),
    SingleCoinList(id: 4423, name: "hgf", symbol: "BTC", slug: "bitcoin", cmc_rank: 2, last_updated: "2018-06-02T22:51:28.209Z", quote: Quote(USD: USD(price: 4324.2, percent_change_1h: -53425423.54, percent_change_24h: 4523542.45, percent_change_7d: 432234.23, market_cap: 5324543532.53)))
]


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


