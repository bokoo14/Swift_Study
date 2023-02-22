//
//  CoinData.swift
//  ByteCoin
//
//  Created by Bokyung on 2023/02/22.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

// make the struct conform to the Decodable protocol to use it to decode our JSON
// NOTE: You can also use the Codable type alias to conform to both Decodable and Encodable protocols in case you wnat to turn a Swift object back into a JSON
struct CoinData: Decodable {
    // there's only 2 property we're interested in the JSON data, that's the last price of bitcoin. Because it's a decimal number, we'll give it a Double data type
    let rate: Double
}
