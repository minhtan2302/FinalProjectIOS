//
//  DeliveryTableViewCell.swift
//  FinalIOS
//
//  Created by Tân Phù on 10/08/2022.
//

import UIKit

class FavoriteItem: Codable {
    var productFavorite: ProductData
    
    init (productFavorite: ProductData) {
        self.productFavorite = productFavorite
    }
}

class DeliveryTableViewCell: UITableViewCell {

    @IBOutlet weak var cellCartView: UIView!
    @IBOutlet weak var imageProduct: UIImageView!
    @IBOutlet weak var nameProduct: UILabel!
    @IBOutlet weak var subNameProduct: UILabel!
    @IBOutlet weak var priceProduct: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        cellCartView.layer.cornerRadius = 13.0
        cellCartView.clipsToBounds = true
        
        imageProduct.layer.cornerRadius = 13.0
        imageProduct.clipsToBounds = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setData(data: CardItem?) {
        imageProduct.downloaded(from: data!.product.imageProduct, completion: nil)
        nameProduct.text = data?.product.titleProduct ?? ""
        subNameProduct.text = data?.product.subTitle ?? ""
        priceProduct.text = "$\((data?.product.priceProduct ?? 0.0) * Double(data?.amout ?? 1))"
    }
    func setDataFavourite(data: FavoriteItem?) {
        imageProduct.downloaded(from: data?.productFavorite.imageProduct, completion: nil)
        nameProduct.text = data?.productFavorite.titleProduct ?? ""
        subNameProduct.text = data?.productFavorite.subTitle ?? ""
        priceProduct.text = "$\(data?.productFavorite.priceProduct ?? 0.0)"
    }
}
