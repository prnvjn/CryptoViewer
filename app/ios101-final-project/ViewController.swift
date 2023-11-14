//
//  ViewController.swift
//  ios101-project6-tumblr
//

import UIKit
import Nuke

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    var posts: [Post] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        fetchPosts()

    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell

        let post = posts[indexPath.row]

        cell.summaryLabel.text = post.summary

        if let photo = post.photos.first {
            let url = photo.originalSize.url
            Nuke.loadImage(with: url, into: cell.postImageView)
        }

        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let selectedIndexPath = tableView.indexPathForSelectedRow else { return }

        let selectedPost = posts[selectedIndexPath.row]
        guard let detailViewController = segue.destination as? DetailViewController else {return}
                detailViewController.post = selectedPost
    }
    
    
    func fetchPosts() {
        let url = URL(string: "https://min-api.cryptocompare.com/data/all/coinlist?6a8b0fb0852551b87cfbe4da558c1f429f7747345cbced46ba172682c3c3b18a")!
//        let session = URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                print("❌ Error: \(error.localizedDescription)")
//                return
//            }
//
//
//            guard let data = data else {
//                print("❌ Data is NIL")
//                return
//            }
//            do {
//                print(data)
//                let coinResponse = try JSONDecoder().decode(CoinResponse.self, from: data)
//                print(coinResponse)
//                let coinDetail = coinResponse.Data
//                print("✅ We got \(coinDetail.count) coins!")
////                                  for post in posts {
////                                      print("🍏 Summary: \(post.summary)")
////                                  }
//
////                DispatchQueue.main.async { [weak self] in
////                    let coinsDetail = coinResponse
//////                    let posts = blog.response.posts
//////                    self?.posts = posts
//////                    self?.tableView.reloadData()
////
//////                    print("✅ We got \(posts.count) posts!")
//////                    for post in posts {
//////                        print("🍏 Summary: \(post.summary)")
//////                    }
////                }
//
//            } catch {
//                print("❌ Error decoding JSON: \(error.localizedDescription)")
//            }
//        }
        
        let json = """
              {
                  "Response": "Success",
                  "Message": "Coin list succesfully returned!",
                  "Data": {
                      "42": {
                          "Id": "4321",
                          "Url": "/coins/42/overview",
                          "ImageUrl": "/media/35650717/42.jpg",
                          "ContentCreatedOn": 1427211129,
                          "Name": "42",
                          "Symbol": "42",
                          "CoinName": "42 Coin",
                          "FullName": "42 Coin (42)",
                          "Description": "Everything about 42 coin is 42 - apart from the transaction fees and difficulty retargetting - 0.00000001 and 7.5mins. A scrypt coin with 42 coins max, a 42 second block time, with superblocks giving 10 times the standard block reward of 0.0000420 42's.\n\n42 coin is a cryptocurrency with completed emission, fair distribution (no ICO, premine or instamine) and both private and public transaction support. The maximum supply of 42 coins makes the remaining 41.99 extremely rare. The innovative deflationary model provides a constant rise in incentives both for miners and long term investors. 42-coin delivers a hybrid of Proof-of-Work and Proof-of-Stake transaction confirmation methods and represents a new way of securing the network against 51% attacks.",
                          "AssetTokenStatus": "N/A",
                          "Algorithm": "Scrypt",
                          "ProofType": "PoW/PoS",
                          "SortOrder": "34",
                          "Sponsored": false,
                          "Taxonomy": {
                              "Access": "",
                              "FCA": "",
                              "FINMA": "",
                              "Industry": "",
                              "CollateralizedAsset": "",
                              "CollateralizedAssetType": "",
                              "CollateralType": "",
                              "CollateralInfo": ""
                          },
                          "Rating": {
                              "Weiss": {
                                  "Rating": "",
                                  "TechnologyAdoptionRating": "",
                                  "MarketPerformanceRating": ""
                              }
                          },
                          "IsTrading": false,
                          "TotalCoinsMined": 0,
                          "CirculatingSupply": 0,
                          "BlockNumber": 0,
                          "NetHashesPerSecond": 0,
                          "BlockReward": 0,
                          "BlockTime": 0,
                          "AssetLaunchDate": "2014-01-05",
                          "AssetWhitepaperUrl": "",
                          "AssetWebsiteUrl": "https://42-coin.org/",
                          "MaxSupply": 42,
                          "MktCapPenalty": 0,
                          "IsUsedInDefi": 0,
                          "IsUsedInNft": 0,
                          "PlatformType": "blockchain"
                      },
                      "300": {
                          "Id": "749869",
                          "Url": "/coins/300/overview",
                          "ImageUrl": "/media/27010595/300.png",
                          "ContentCreatedOn": 1517935016,
                          "Name": "300",
                          "Symbol": "300",
                          "CoinName": "300 token",
                          "FullName": "300 token (300)",
                          "Description": "300 token is an ERC20 token.",
                          "AssetTokenStatus": "N/A",
                          "Algorithm": "N/A",
                          "ProofType": "N/A",
                          "SortOrder": "2212",
                          "Sponsored": false,
                          "Taxonomy": {
                              "Access": "",
                              "FCA": "",
                              "FINMA": "",
                              "Industry": "",
                              "CollateralizedAsset": "",
                              "CollateralizedAssetType": "",
                              "CollateralType": "",
                              "CollateralInfo": ""
                          },
                          "Rating": {
                              "Weiss": {
                                  "Rating": "",
                                  "TechnologyAdoptionRating": "",
                                  "MarketPerformanceRating": ""
                              }
                          },
                          "IsTrading": false,
                          "TotalCoinsMined": 0,
                          "CirculatingSupply": 0,
                          "BlockNumber": 0,
                          "NetHashesPerSecond": 0,
                          "BlockReward": 0,
                          "BlockTime": 0,
                          "AssetLaunchDate": "2017-06-29",
                          "AssetWhitepaperUrl": "",
                          "AssetWebsiteUrl": "http://300tokensparta.com/",
                          "MaxSupply": -1,
                          "MktCapPenalty": 0,
                          "IsUsedInDefi": 0,
                          "IsUsedInNft": 0,
                          "PlatformType": "token",
                          "BuiltOn": "ETH",
                          "SmartContractAddress": "0xaec98a708810414878c3bcdf46aad31ded4a4557",
                          "OtherSmartContractAddress": "ETH:0xaec98a708810414878c3bcdf46aad31ded4a4557",
                          "DecimalPoints": 18
                      },
                      "365": {
                          "Id": "33639",
                          "Url": "/coins/365/overview",
                          "ImageUrl": "/media/352070/365.png",
                          "ContentCreatedOn": 1480032918,
                          "Name": "365",
                          "Symbol": "365",
                          "CoinName": "365Coin",
                          "FullName": "365Coin (365)",
                          "Description": "365Coin is a Proof of Work and Proof of Stake cryptocurrency. This coin has a 50% APR in staking rewards and a 13% premine (299 million coins). The 365Coin is a free open source project derived from Bitcoin, with the goal of providing a long-term energy-efficient script-based cryptocurrency. Build on the foundation of Bitcoin and PPCoin, innovations such as POS help further advance the field of cryptocurrency. ",
                          "AssetTokenStatus": "N/A",
                          "Algorithm": "X11",
                          "ProofType": "PoW/PoS",
                          "SortOrder": "916",
                          "Sponsored": false,
                          "Taxonomy": {
                              "Access": "",
                              "FCA": "",
                              "FINMA": "",
                              "Industry": "",
                              "CollateralizedAsset": "",
                              "CollateralizedAssetType": "",
                              "CollateralType": "",
                              "CollateralInfo": ""
                          },
                          "Rating": {
                              "Weiss": {
                                  "Rating": "",
                                  "TechnologyAdoptionRating": "",
                                  "MarketPerformanceRating": ""
                              }
                          },
                          "IsTrading": true,
                          "TotalCoinsMined": 0,
                          "CirculatingSupply": 0,
                          "BlockNumber": 0,
                          "NetHashesPerSecond": 0,
                          "BlockReward": 0,
                          "BlockTime": 0,
                          "AssetLaunchDate": "2016-11-02",
                          "AssetWhitepaperUrl": "",
                          "AssetWebsiteUrl": "",
                          "MaxSupply": 2300000000,
                          "MktCapPenalty": 0,
                          "IsUsedInDefi": 0,
                          "IsUsedInNft": 0,
                          "PlatformType": "blockchain"
                      },
                      "404": {
                          "Id": "21227",
                          "Url": "/coins/404/overview",
                          "ImageUrl": "/media/35650851/404-300x300.jpg",
                          "ContentCreatedOn": 1466100361,
                          "Name": "404",
                          "Symbol": "404",
                          "CoinName": "404Coin",
                          "FullName": "404Coin (404)",
                          "Description": "404 is a PoW/PoS hybrid cryptocurrency that allows users to send and receive instant payments. 404 coin rewards users for maintaining the 404 Blockchain through mining or staking 404 coins.",
                          "AssetTokenStatus": "N/A",
                          "Algorithm": "Scrypt",
                          "ProofType": "PoW/PoS",
                          "SortOrder": "602",
                          "Sponsored": false,
                          "Taxonomy": {
                              "Access": "",
                              "FCA": "",
                              "FINMA": "",
                              "Industry": "",
                              "CollateralizedAsset": "",
                              "CollateralizedAssetType": "",
                              "CollateralType": "",
                              "CollateralInfo": ""
                          },
                          "Rating": {
                              "Weiss": {
                                  "Rating": "",
                                  "TechnologyAdoptionRating": "",
                                  "MarketPerformanceRating": ""
                              }
                          },
                          "IsTrading": true,
                          "TotalCoinsMined": 0,
                          "CirculatingSupply": 0,
                          "BlockNumber": 0,
                          "NetHashesPerSecond": 0,
                          "BlockReward": 0,
                          "BlockTime": 0,
                          "AssetLaunchDate": "2016-06-07",
                          "AssetWhitepaperUrl": "",
                          "AssetWebsiteUrl": "https://404coin.com",
                          "MaxSupply": 532000000,
                          "MktCapPenalty": 0,
                          "IsUsedInDefi": 0,
                          "IsUsedInNft": 0,
                          "PlatformType": "blockchain"
                      }
                  }
              }
"""
        let jsonData = json.data(using: .utf8)!
        do {
            let decoder = JSONDecoder()
            let coinResponse = try decoder.decode(CoinResponse.self, from: jsonData)
            print("Response: \(coinResponse.Response)")
            print("Message: \(coinResponse.Message)")

            for (key, value) in coinResponse.Data {
                print("Coin \(key): \(value.Name)")
            }
        } catch {
            print("Error: \(error)")
        }
        
//        session.resume()
    }
}
