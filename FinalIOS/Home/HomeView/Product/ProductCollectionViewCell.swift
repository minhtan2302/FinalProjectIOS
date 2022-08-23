//
//  ProductCollectionViewCell.swift
//  FinalIOS
//
//  Created by Tân Phù on 21/07/2022.
//

import UIKit

//struct ProductDTO {
//    var imageUrl: String
//    var name: String
//    var branch: String
//    var price: Double
//    
//    func mapToProductCollectionViewCellViewData() -> ProductCollectionViewCellViewData? {
//        ProductCollectionViewCellViewData(image: imageUrl, name: name, type: branch, price: price)
//    }
//}


struct ProductCollectionViewCellViewData {
    var id : Int
    var image: String
    var name: String
    var type: String
    var price: Double
}

class ProductCollectionViewCell: UICollectionViewCell {

    // Access Control
    
    @IBOutlet private weak var viewProduct: UIView!
    @IBOutlet private weak var imageProduct: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subTitleLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        imageProduct.layer.cornerRadius = 10.0
        imageProduct.clipsToBounds = true
        
    }
    
    // Cach viet dung
    func updateData(data: ProductCollectionViewCellViewData?) {
        imageProduct.downloaded(from: data!.image, completion: nil)
        titleLabel.text = data?.name
        subTitleLabel.text = data?.type
        priceLabel.text = "$\(data?.price ?? 0)"
    }
}

    // DU lieu tu server
//    let aothunDTO = ProductDTO(imageUrl: "", name: "Ao thun", branch: "VietNam", price: 50.0)

