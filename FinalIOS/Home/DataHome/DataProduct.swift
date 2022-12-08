//
//  DataProduct.swift
//  FinalIOS
//
//  Created by Tân Phù on 21/07/2022.
//

import Foundation
// Dummy Server Response DTO
struct ProductData: Codable {
    var id: Int
    var imagePath : [String]
    var imageProduct: String
    var titleProduct: String
    var subTitle: String
    var description: String
    var rating: Int
    var priceProduct: Double
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case imagePath = "imagePaths"
        case imageProduct = "images"
        case titleProduct = "name"
        case subTitle = "type"
        case description = "description"
        case rating = "rating"
        case priceProduct = "price"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        imagePath = try container.decode([String].self, forKey: .imagePath)
        imageProduct = try container.decode(String.self, forKey: .imageProduct)
        titleProduct = try container.decode(String.self, forKey: .titleProduct)
        subTitle = try container.decode(String.self, forKey: .subTitle)
        description = try container.decode(String.self, forKey: .description)
        rating = try container.decode(Int.self, forKey: .rating)
        priceProduct = try container.decode(Double.self, forKey: .priceProduct)
    }
    
    init(
        id: Int,
        imagePath: [String],
         imageProduct: String,
         titleProduct: String,
         subTitle: String,
         description: String,
         rating: Int,
         priceProduct: Double)
    {
        self.id = id
        self.imagePath = imagePath
        self.imageProduct = imageProduct
        self.subTitle = subTitle
        self.titleProduct = titleProduct
        self.description = description
        self.priceProduct = priceProduct
        self.rating = rating
    }
    

    
    func mapToProductCollectionViewCellViewData() -> ProductCollectionViewCellViewData {
        ProductCollectionViewCellViewData(id: id, image: imageProduct, name: titleProduct, type: subTitle, price: priceProduct)
    }
//    func mapToDetailProductViewControllerViewData() -> DetailProductViewControllerViewData {
//        DetailProductViewControllerViewData(imagePaths: imagePath, nameTitle: titleProduct, type: subTitle, desc: description, price: priceProduct)
//    }
//     func mapToCartViewControllerViewData() -> CartViewControllerViewData {
//         CartViewControllerViewData(image: imageProduct, nameProduct: titleProduct, typeProduct: subTitle, priceProduct: priceProduct)
//     }
     func mapToCartItem() -> CardItem {
         CardItem(product: ProductData(id: id,imagePath: imagePath, imageProduct: imageProduct, titleProduct: titleProduct, subTitle: subTitle, description: description, rating: rating, priceProduct: priceProduct), amout: 1)
     }
}
