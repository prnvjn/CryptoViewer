//
//  CrytoTableViewCell.swift
//  CryptoView
//
//  Created by Pranav J on 11/15/23.
//

import UIKit


struct CryptoTableViewCellModel{
    let name: String
    let symbol: String
    let price: String
}

class CrytoTableViewCell: UITableViewCell {
    
     
    
    @IBOutlet weak var nameLabel: UILabel! = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    
    @IBOutlet weak var symbolLabel: UILabel! = {
           let label = UILabel()
           label.font = .systemFont(ofSize: 20, weight: .medium)
           return label
       }()
    

    @IBOutlet weak var priceLabel: UILabel! = {
        let label = UILabel()
        label.textColor = .systemGreen
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 20, weight: .medium)
        return label
    }()

       

//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        contentView.addSubview(nameLabel)
//        contentView.addSubview(symbolLabel)
//        contentView.addSubview(priceLabel)
//    }
//    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//    }
//    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        
//        nameLabel.sizeToFit()
//        priceLabel.sizeToFit()
//        symbolLabel.sizeToFit()
//        
//        nameLabel.frame = CGRect(
//            x: 15, y: 0, width: contentView.frame.size.width/2, height:  contentView.frame.size.height/2)
//        symbolLabel.frame = CGRect(
//            x: 15, y: contentView.frame.size.height/2, width: contentView.frame.size.width/2, height:  contentView.frame.size.height/2)
//        priceLabel.frame = CGRect(
//            x: contentView.frame.size.width/2, y: 0, width: (contentView.frame.size.width/2)-15, height:  contentView.frame.size.height)
//    }
//    private func setupConstraints() {
//            // Disable the translatesAutoresizingMaskIntoConstraints property for each label
//            nameLabel.translatesAutoresizingMaskIntoConstraints = false
//            symbolLabel.translatesAutoresizingMaskIntoConstraints = false
//            priceLabel.translatesAutoresizingMaskIntoConstraints = false
//
//            // Set up constraints for nameLabel
//            NSLayoutConstraint.activate([
//                nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
//                nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
//                nameLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5),
//                nameLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.5)
//            ])
//
//            // Set up constraints for symbolLabel
//            NSLayoutConstraint.activate([
//                symbolLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
//                symbolLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
//                symbolLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5),
//                symbolLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.5)
//            ])
//
//            // Set up constraints for priceLabel
//            NSLayoutConstraint.activate([
//                priceLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
//                priceLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
//                priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
//                priceLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor)
//            ])
//        }
    func configure(with viewModel: CryptoTableViewCellModel ){
        nameLabel.text = viewModel.name
        priceLabel.text = viewModel.price
        symbolLabel.text = viewModel.symbol
    }
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
}
