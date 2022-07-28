//
//  CartTableViewCell.swift
//  FinalIOS
//
//  Created by Tân Phù on 20/07/2022.
//

import UIKit

class CartTableViewCell: UITableViewCell {

    @IBOutlet weak var cellCartView: UIView!
    @IBOutlet weak var rangerView: UIView!
    @IBOutlet weak var imageProduct: UIImageView!
    @IBOutlet weak var nameProduct: UILabel!
    @IBOutlet weak var subNameProduct: UILabel!
    @IBOutlet weak var priceProduct: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        cellCartView.layer.cornerRadius = 13.0
        cellCartView.clipsToBounds = true
        
        imageProduct.layer.cornerRadius = 13.0
        imageProduct.clipsToBounds = true
        
        rangerView.layer.cornerRadius = 15.0
        rangerView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
