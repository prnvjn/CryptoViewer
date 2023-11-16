//
//  ApiCaller.swift
//  CryptoView
//
//  Created by Pranav J on 11/15/23.
//

import Foundation

final class ApiCaller{
    
    static let shared = ApiCaller()
    
    private struct Constants {
        static let apikey = "B7DC6682-BCC6-449F-A7D6-F75F11CF3BF4"
        static let assetsEndpoint = "https://rest.coinapi.io/v1/assets/"
    }
    
    private init(){}
    
    public func getAllCrytoData(
        completion: @escaping(Result<[Crypto],Error>)-> Void
    ){
        guard let url = URL(string: Constants.assetsEndpoint + "?apikey=" + Constants.apikey)else{
            return
        }
        let task = URLSession.shared.dataTask(with: url){
            data,_,error in guard let data = data, error == nil else {
                return
            }
            do{
                let jsonData = try JSONDecoder().decode([Crypto].self, from: data)
                let cryptos = jsonData.filter{crypto in
                    return crypto.type_is_crypto == 1
                }
                
                completion(.success(cryptos))
            }
            catch{
                completion(.failure(error))
            }
        }
        task.resume()
        
    }
}
