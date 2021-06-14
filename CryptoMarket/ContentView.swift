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
    @State var coins: [SingleCoinList] = []
//    @State var coins = coinData.sorted{
//        $0.cmc_rank < $1.cmc_rank
//    }
    var body: some View {
        NavigationView {
            if self.isActive{
                List(coins) { coin in
                    ItemRow(coin: coin)
                }
                .navigationBarTitle(Text("Crypto Market"))
                .onAppear{
                    API().getListings { (coin) in
                        self.coins = coin.data.sorted{
                            $0.cmc_rank < $1.cmc_rank
                        }
                    }
                }
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

//var coinData = [
//    SingleCoinList(id: 1, name: "BitCoin", symbol: "BTC", slug: "bitcoin", cmc_rank: 1, last_updated: "2018-06-02T22:51:28.209Z", circulating_supply: 1221121, total_supply: 86543, quote: Quote(USD: USD(price: 4324.2, percent_change_1h: 5.3, percent_change_24h: 4523542.45, percent_change_7d: 432234.23, market_cap: 5324543532.53, volume_24h: 1231.12))),
//    SingleCoinList(id: 42, name: "fds", symbol: "BTC", slug: "bitcoin", cmc_rank: 4, last_updated: "2018-06-02T22:51:28.209Z", circulating_supply: 1221121, total_supply: 86543, quote: Quote(USD: USD(price: 4324.2, percent_change_1h: -2.4, percent_change_24h: 4523542.45, percent_change_7d: 432234.23, market_cap: 5324543532.53, volume_24h: 1231.12))),
//    SingleCoinList(id: 23, name: "qwe", symbol: "BTC", slug: "bitcoin", cmc_rank: 3, last_updated: "2018-06-02T22:51:28.209Z", circulating_supply: 1221121, total_supply: 86543, quote: Quote(USD: USD(price: 4324.2, percent_change_1h: 2.9, percent_change_24h: 4523542.45, percent_change_7d: 432234.23, market_cap: 5324543532.53, volume_24h: 1231.12))),
//    SingleCoinList(id: 4423, name: "hgf", symbol: "BTC", slug: "bitcoin", cmc_rank: 2, last_updated: "2018-06-02T22:51:28.209Z", circulating_supply: 1221121, total_supply: 86543, quote: Quote(USD: USD(price: 4324.2, percent_change_1h: -5.54, percent_change_24h: 4523542.45, percent_change_7d: 432234.23, market_cap: 5324543532.53, volume_24h: 1231.12)))
//]


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


