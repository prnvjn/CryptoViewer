//
//  DetailViewController.swift
//  CryptoView
//
//  Created by Pranav J on 11/20/23.
//

import UIKit
import Nuke
class DetailViewController: UIViewController {
    var cryto: CryptoTableViewCellModel?
    
    @IBOutlet weak var CryptoName: UILabel!
    
    
    @IBOutlet weak var startDate: UILabel!
    
    @IBOutlet weak var cryptoImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CryptoName.text = cryto?.symbol
        
        let iconString =  ApiCaller.shared.icons.filter({
            icon in icon.asset_id == cryto?.symbol
        }).first?.url ?? ""
        
       
        if let iconUrl = URL(string: iconString){
            Nuke.loadImage(with: iconUrl, into: cryptoImage)
        }
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let startData = dateFormatter.date(from: cryto?.data_start ?? ""){
            startDate.text = "Cryto Created on \(startData))"

        }else {
            startDate.text = "Invalid Date"
        }
        
      
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
