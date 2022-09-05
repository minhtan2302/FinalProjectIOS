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
//let imagePaths: [[String]] = [
//    ["product-1","product-2","product-1"],
//    ["product-1","product-2","product-1"],
//    ["product-1","product-2","product-1"],
//    ["product-1","product-2","product-1"],
//    ["product-1","product-2","product-1"],
//    ["product-1","product-2","product-1"],
//    ["product-1","product-2","product-1"],
//    ["product-1","product-2","product-1"],
//    ["product-1","product-2","product-1"],
//    ["product-1","product-2","product-1"]
//]
//
//let image: [String] = ["product-1",
//                       "product-2",
//                       "product-1",
//                       "product-2",
//                       "product-1",
//                       "product-2",
//                       "product-1",
//                       "product-2",
//                       "product-1",
//                       "product-2"]
//let title: [String] = ["The Marc Jacobs",
//                       "The Marc Jacobs",
//                       "Axel Arigato",
//                       "Axel Arigato",
//                       "The Marc Jacobs",
//                       "Axel Arigato",
//                       "The Marc Jacobs",
//                       "Axel Arigato",
//                       "The Marc Jacobs",
//                       "Axel Arigato"]
//let subtitle: [String] = ["Traveler Tote",
//                          "Clean 90 Triple Sneakers",
//                          "Traveler Tote",
//                          "Clean 90 Triple Sneakers",
//                          "Clean 90 Triple Sneakers",
//                          "Traveler Tote",
//                          "Clean 90 Triple Sneakers",
//                          "Traveler Tote",
//                          "Clean 90 Triple Sneakers",
//                          "Traveler Tote"]
//let desc : [String] = ["Get a little lift from these Sam",
//                       "Get a little lift from these Sam",
//                       "Get a little lift from these Sam",
//                       "Get a little lift from these Sam",
//                       "Get a little lift from these Sam",
//                       "Get a little lift from these Sam",
//                       "Get a little lift from these Sam",
//                       "Get a little lift from these Sam",
//                       "Get a little lift from these Sam",
//                       "Get a little lift from these Sam"]
//let price: [Double] = [195.00,
//                       245.00,
//                       275.00,
//                       300.00,
//                       245.00,
//                       275.00,
//                       245.00,
//                       275.00,
//                       245.00,
//                       275.00]
//    
//extension ProductData {
//    static func getData() -> [ProductData] {
//        var datas: [ProductData] = []
//        for i in 0..<10 {
//            let imagePath = imagePaths[i]
//            let image = image[i]
//            let titles = title[i]
//            let subtitle = subtitle[i]
//            let prices = price[i]
//            let descS = desc[i]
//            let data = ProductData(imagePath: imagePath, imageProduct: image, titleProduct: titles, subTitle: subtitle,description: descS, rating: 0, priceProduct: prices)
//            datas.append(data)
//        }
//        return datas
//    }
//}
