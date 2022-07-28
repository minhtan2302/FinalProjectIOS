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
    var image: String
    var name: String
    var type: String
    var price: String
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
    
    // Can update image, name, type, price
    // Cach viet sai
//    func updateData(image: String, name: String, type: String, price: Double) {
//        
//    }
    
    // Cach viet dung
    func updateData(data: ProductCollectionViewCellViewData?) {
        imageProduct.image = UIImage(named: data!.image ?? "")
        titleLabel.text = data?.name
        subTitleLabel.text = data?.type
        priceLabel.text = data?.price
    }
}

func testing() {
    // DU lieu tu server
//    let aothunDTO = ProductDTO(imageUrl: "", name: "Ao thun", branch: "VietNam", price: 50.0)

    let cell = ProductCollectionViewCell()
    // Dung. Nhung k nen lam
//    cell.updateData(image: aothunDTO.imageUrl, name: aothunDTO.name, type: aothunDTO.branch, price: aothunDTO.price)

//    cell.updateData(data: aothunDTO.mapToProductCollectionViewCellViewData())
//    cell.updateData(data: ProductCollectionViewCellViewData(image: "", name: "", type: "", price: 20.0))
}
