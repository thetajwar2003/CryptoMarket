//
//  Data.swift
//  CryptoMarket
//
//  Created by Tajwar Rahman on 6/11/21.
//

import SwiftUI

struct LatestListing: Codable{
    var data: [SingleCoinList]
}

struct SingleCoinList: Codable, Identifiable {
    var id: Int
    var name: String
    var symbol: String
    var slug: String
    var cmc_rank: Int
    var last_updated: String
    var quote: Quote
}

struct Quote: Codable {
    var USD: USD
}

struct USD: Codable {
    var price: Double
    var percent_change_1h: Double
    var percent_change_24h: Double
    var percent_change_7d: Double
    var market_cap: Double
}

class API {
    func getListings(completion: @escaping(LatestListing) -> ()){
        let url = URL(string: "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest")!
        var req = URLRequest(url: url)
        req.addValue(APIKEY, forHTTPHeaderField: "X-CMC_PRO_API_KEY")
        req.addValue("application/json", forHTTPHeaderField: "Content-Type")

        URLSession.shared.dataTask(with: req){data, response, error in
            guard let data = data else {
                print("\(error?.localizedDescription ?? "Unknown error")")
                return
            }
            let listings = try! JSONDecoder().decode(LatestListing.self, from: data)
            
            DispatchQueue.main.async {
//                let quote: Any = data?.quote?.USD
                completion(listings)
            }
        }.resume()
    }
}
