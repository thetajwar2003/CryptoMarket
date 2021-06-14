//
//  CoinDetail.swift
//  CryptoMarket
//
//  Created by Tajwar Rahman on 6/12/21.
//

import SwiftUI

struct CoinDetail: View {
    var coin: SingleCoinList
    var body: some View {
        VStack {
            let rank = coin.cmc_rank
            let price = String(format: "%.2f", coin.quote.USD.price)
            let change = String(format: "%.2f", coin.quote.USD.percent_change_1h)
            let positive = coin.quote.USD.percent_change_1h > 0
            let market_cap = String(format: "%.2f", coin.quote.USD.market_cap)
            let total_supply = String(format: "%.2f", coin.total_supply)
            let fdmc = String(format: "%.5f", (coin.quote.USD.price) * Double(coin.total_supply))
            let circulating_supply = String(format: "%.2f", coin.circulating_supply)
            let volume = String(format: "%.2f", coin.quote.USD.volume_24h)
            let vol_per_mcap = String(format: "%.2f", coin.quote.USD.volume_24h / coin.quote.USD.market_cap)
            HStack{
                VStack{
                    HStack {
                        URLImage(url: "https://s2.coinmarketcap.com/static/img/coins/64x64/\(coin.id).png").frame(width: 48, height: 48, alignment: .leading)
                        VStack(alignment: .leading) {
                            Text(coin.name)
                                .font(.title)
                                .fontWeight(.heavy)
                            Text(coin.symbol)
                                .foregroundColor(.secondary)
                                .font(.caption)
                        }
                    }
                    HStack{
                        Text("Rank: # \(rank)")
                            .font(.caption2)
                            .foregroundColor(.white)
                            .padding(5)
                            .background(RoundedRectangle(cornerRadius: 4).fill(Color.gray))
                    }
                }.padding(.leading)
                Spacer()
                VStack{
                    VStack(alignment: .leading) {
                        Text("\(coin.name) Price (\(coin.symbol))")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        Text("$\(price)")
                            .font(.title)
                            .fontWeight(.heavy)
                    }
                    HStack{
                        Triangle()
                            .fill(Color.white)
                            .frame(width: 10, height: 10)
                            .rotationEffect(positive ? .degrees(0) : .degrees(180))
                            .padding(.leading, 5)
                        Text("\(change)%")
                            .foregroundColor(.white)
                            .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 5))
                    }.background(RoundedRectangle(cornerRadius: 4).fill(positive ? Color.green : Color.red))
                }.padding(.trailing)
            }.padding(.top)
            Divider()
            TabView {
                HStack {
                    Spacer()
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Market Cap")
                                .font(.caption)
                                .foregroundColor(.secondary)
                            Image(systemName: "info.circle")
                                .resizable()
                                .frame(width: 10, height: 10)
                        }
                        Text("$ \(market_cap)")
                            .font(.caption)
                            .fontWeight(.bold)
                        HStack{
                            Triangle()
                                .fill(positive ? Color.green : Color.red)
                                .frame(width: 5, height: 5)
                                .rotationEffect(positive ? .degrees(0) : .degrees(180))
                            Text("\(change)%")
                                .font(.caption)
                                .foregroundColor(positive ? Color.green : Color.red)
                        }
                    }
                    Spacer()
                    Divider()
                    Spacer()
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Fully Diluted Market Cap")
                                .font(.caption)
                                .foregroundColor(.secondary)
                            Image(systemName: "info.circle")
                                .resizable()
                                .frame(width: 10, height: 10)
                        }
                        Text("$ \(fdmc)")
                            .font(.caption)
                            .fontWeight(.bold)
                        HStack{
                            Triangle()
                                .fill(positive ? Color.green : Color.red)
                                .frame(width: 5, height: 5)
                                .rotationEffect(positive ? .degrees(0) : .degrees(180))
                            Text("\(change)%")
                                .font(.caption)
                                .foregroundColor(positive ? Color.green : Color.red)
                        }
                    }
                    Spacer()
                }
                .frame(height: 100)
                .cornerRadius(5)
                HStack {
                    Spacer()
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Volume")
                                .font(.caption)
                                .foregroundColor(.secondary)
                            Text("24h")
                                .font(.caption2)
                                .foregroundColor(.white)
                                .padding(3)
                                .background(RoundedRectangle(cornerRadius: 4).fill(Color.gray))
                            Image(systemName: "info.circle")
                                .resizable()
                                .frame(width: 10, height: 10)
                        }
                        Text("$\(volume)")
                            .font(.caption)
                            .fontWeight(.bold)
                        Text("Volume / Market Cap")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        Text("\(vol_per_mcap)")
                            .font(.caption)
                            .fontWeight(.bold)
                    }
                    Spacer()
                    Divider()
                    Spacer()
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Circulating Supply")
                                .font(.caption)
                                .foregroundColor(.secondary)
                            Image(systemName: "info.circle")
                                .resizable()
                                .frame(width: 10, height: 10)
                        }
                        Text("\(circulating_supply) \(coin.symbol)")
                            .font(.caption)
                            .fontWeight(.bold)
                        HStack{
                            Text("Total Supply")
                                .font(.caption)
                                .foregroundColor(.secondary)
                            Text("\(total_supply)")
                                .font(.caption)
                                .fontWeight(.bold)
                        }
                    }
                    Spacer()
                }
                .frame(height: 100)
                .cornerRadius(5)
            }
            .frame(height:100)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            Divider()
            Spacer()
            
            rank == 1 ? (
                ScrollView {
                    VStack(alignment: .leading) {
                        Text("What is Bitcoin?")
                            .font(.title)
                            .fontWeight(.bold)
                        Text("Bitcoin is a decentralized cryptocurrency originally described in a 2008 whitepaper by a person, or group of people, using the alias Satoshi Nakamoto. It was launched soon after, in January 2009.")
                        Text("Bitcoin is a peer-to-peer online currency, meaning that all transactions happen directly between equal, independent network participants, without the need for any intermediary to permit or facilitate them. Bitcoin was created, according to Nakamoto’s own words, to allow “online payments to be sent directly from one party to another without going through a financial institution.”")
                        Text("Some concepts for a similar type of a decentralized electronic currency precede BTC, but Bitcoin holds the distinction of being the first-ever cryptocurrency to come into actual use.")
                    }
                }
            .padding(.leading)
            .padding(.trailing))
                :
            (
                ScrollView {
                    VStack(alignment: .leading) {
                        Text("What is Dogecoin?")
                            .font(.title)
                            .fontWeight(.bold)
                        Text("Dogecoin (DOGE) is based on the popular doge Internet meme and features a Shiba Inu on its logo. The open-source digital currency was created by Billy Markus from Portland, Oregon and Jackson Palmer from Sydney, Australia, and was forked from Litecoin in December 2013. Dogecoin's creators envisaged it as a fun, light-hearted cryptocurrency that would have greater appeal beyond the core Bitcoin audience, since it was based on a dog meme. Tesla CEO Elon Musk posted several tweets on social media that Dogecoin is his favorite coin.")
                        Text("Dogecoin differs from Bitcoin's proof-of-work protocol in several ways, one of which is by using Scrypt technology. The altcoin has also a block time of 1 minute, and the total supply is uncapped, which means that there is no limit to the number of Dogecoin that can be mined. You can mine Dogecoin either solo, or by joining a mining pool. A Doge miner can mine the digital currency on Windows, Mac or Linux, and with a GPU. As of 2014, you can also mine Litecoin in the same process of mining Dogecoin, as the processes were merged.")
                        Text("Dogecoin has been used primarily as a tipping system on Reddit and Twitter to reward the creation or sharing of quality content. You can get tipped Dogecoin by participating in a community that uses the digital currency, or you can get your Dogecoin from a Dogecoin faucet. A Dogecoin faucet is a website that will give you a small amount of Dogecoin for free as an introduction to the currency, so that you can begin interacting in Dogecoin communities.")
                    }
            }
            .padding(.leading)
            .padding(.trailing))
        }
        .navigationTitle(coin.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}
