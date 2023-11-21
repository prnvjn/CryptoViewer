//
//  ViewController.swift
//  CryptoView
//
//  Created by Pranav J on 11/15/23.
//

import UIKit

//class for api
// ui

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView! = {
        let tableView = UITableView(frame: .zero, style:.grouped)
        tableView.register(CrytoTableViewCell.self, forCellReuseIdentifier: "CrytoTableVIewCEll")
        return tableView
    }()

    var cryto: CrytoTableViewCell!
    private var viewModels = [CryptoTableViewCellModel]()
    static let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.locale = .current
        formatter.allowsFloats = true
        formatter.numberStyle = .currency
        formatter.formatterBehavior = .default
        return formatter
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Crypto View"
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        
        
        ApiCaller.shared.getAllCrytoData {[weak self]result in
            switch result {
            case .success(let models):

                self?.viewModels = models.compactMap({
                    let price = $0.price_usd ?? 0
                    let formatter = ViewController.numberFormatter
                    let priceString = formatter.string(from: NSNumber(value: price))

                    return CryptoTableViewCellModel(name: $0.name ?? "N/A", symbol: $0.asset_id, price: priceString ?? "N/A", data_start: $0.data_start, data_end: $0.data_end)
                })
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
        
        
        
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let selectedIndexPath = tableView.indexPathForSelectedRow else{
            return
        }
        let selectedCrypto = viewModels[selectedIndexPath.row]
        guard let detailViewController = segue.destination as? DetailViewController else {
            return
        }
  
        detailViewController.cryto = selectedCrypto

    }

    override func viewDidLayoutSubviews() {
super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
//        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "CrytoTableVIewCEll",
            for: indexPath) as! CrytoTableViewCell
//
    
        cell.configure(with: viewModels[indexPath.row])
//      let cell = UITableViewCell()
//        cell.textLabel?.text = "hello"
        return cell
                
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}

 
