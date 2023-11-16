//
//  Models.swift
//  CryptoView
//
//  Created by Pranav J on 11/15/23.
//

import Foundation

struct Crypto: Codable{
    let asset_id: String
    let type_is_crypto: Int
    let name:String?
    let price_usd: Float?
    let id_icon: String?
    
    
}
//"asset_id": "LTC",
//       "name": "Litecoin",
//       "type_is_crypto": 1,
//       "data_quote_start": "2014-04-21T00:00:00.0000000Z",
//       "data_quote_end": "2023-11-14T00:00:00.0000000Z",
//       "data_orderbook_start": "2014-04-20T15:06:34.0000000Z",
//       "data_orderbook_end": "2023-07-07T00:00:00.0000000Z",
//       "data_trade_start": "2013-05-19T00:00:00.0000000Z",
//       "data_trade_end": "2023-11-14T00:00:00.0000000Z",
//       "data_symbols_count": 5160,
//       "volume_1hrs_usd": 1317139319.71,
//       "volume_1day_usd": 28918820903.52,
//       "volume_1mth_usd": 174076045482559.66,
//       "price_usd": 73.340572334018371381772727992,
//       "id_icon": "a201762f-1499-41ef-9b84-e0742cd00e48",
//       "data_start": "2013-05-19",
//       "data_end": "2023-11-14"
