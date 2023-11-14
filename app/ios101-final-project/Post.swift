//
//  Post.swift
//  ios101-project6-tumblr
//

import Foundation

struct Blog: Decodable {
    let response: Response
}

struct Response: Decodable {
    let posts: [Post]
}

struct Post: Decodable {
    let summary: String
    let caption: String
    let photos: [Photo]
}

struct Photo: Decodable {
     let originalSize: PhotoInfo

    enum CodingKeys: String, CodingKey {

        // Maps API key name to a more "swifty" version (i.e. lowerCamelCasing and no `_`)
        case originalSize = "original_size"
    }
}

struct PhotoInfo: Decodable {
    let url: URL
}


struct CoinResponse: Decodable {
    let Response: String
    let Message: String
    let Data: [String: CoinDetails]
}
struct CoinDetails: Decodable {
    let Id: String
    let Url: String
    let ImageUrl: String
    let ContentCreatedOn: Int
    let Name: String
    let Symbol: String
    let CoinName: String
    let FullName: String
    let Description: String
    // Add other properties as needed
}
