//
//  DetailHistoryTableViewCell.swift
//  FinalIOS
//
//  Created by Tân Phù on 17/08/2022.
//

import UIKit

class DetailHistoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellCartView: UIView!
    @IBOutlet weak var imageProduct: UIImageView!
    @IBOutlet weak var nameProduct: UILabel!
    @IBOutlet weak var subNameProduct: UILabel!
    @IBOutlet weak var priceProduct: UILabel!
    @IBOutlet weak var sizeProduct: UILabel!
    @IBOutlet weak var amountProduct: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        cellCartView.layer.cornerRadius = 13.0
        cellCartView.clipsToBounds = true
        
        imageProduct.layer.cornerRadius = 13.0
        imageProduct.clipsToBounds = true    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setDataHistory(data: CardItem?) {
        imageProduct.downloaded(from: data?.product.imageProduct, completion: nil)
        nameProduct.text = data?.product.titleProduct ?? ""
        subNameProduct.text = data?.product.subTitle ?? ""
        priceProduct.text = "$\((data?.product.priceProduct ?? 0.0) * Double(data?.amout ?? 0))"
        amountProduct.text = "\(data?.amout ?? 0)"
    }
}
