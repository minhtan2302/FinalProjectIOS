//
//  ApiService.swift
//  FinalIOS
//
//  Created by Tân Phù on 02/08/2022.
//

import Foundation

class ApiService {
    typealias JSON = [String: AnyObject]
    typealias JSONArray = [JSON]
    
    static func getNewArrivals() -> [ProductData] {
        // 1. Doc file
        if let path = Bundle.main.path(forResource: "arrivals", ofType: "json") {
            do {
                // 2. Doc file tu duong dan
                let data: Data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
//                             print("[Debug] data \(data)")
//                             print("[Debug] ========================")
                // 3. Convert data => JSON
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let json = jsonResult as? JSON {
//                                print("[Debug] jsonResult \(jsonResult)")
//                                print("[Debug] json \(json)")
//                                print("[Debug] ========================")
                    if let dataArray = json["data"] as? JSONArray {
//                                        print("[Debug] dataArray \(dataArray)")
//                                        print("[Debug] ========================")
                        var result: [ProductData] = []
                        
                        for i in 0..<dataArray.count {
                            let data: JSON = dataArray[i]
                            let id: Int? = data["id"] as? Int
                            let rate: Int? = data["rating"] as? Int
                            let price: Double? = data["price"] as? Double
                            let desc: String? = data["description"] as? String
                            let name: String? = data["name"] as? String
                            let types: String? = data["type"] as? String
                            let image: String? = data["images"] as? String
                            let imagePaths: [String]? = data["imagePaths"] as? [String]
                            
                            //                    print("Id: \(id!)")
                            //                    print("Name: \(name!)")
                            //                    print("Rate: \(rate!)")
                            //                    print("Price: \(price!)")
                            //                    print("Description: \(desc!)")
                            //                    print("ImgPath: \(imagePaths!)")
                            //                    print("Img: \(image!)")
                            
                            let productData: ProductData = ProductData(id: id ?? 1, imagePath: imagePaths ?? [], imageProduct: image ?? "", titleProduct: name ?? "", subTitle: types ?? "", description: desc ?? "", rating: rate ?? 0 , priceProduct: price ?? 0 )
                            result.append(productData)
                        }
                        
                        return result
                    }
                }
                
            } catch {
                // handle error
            }
        }
        return []
    }
    
    
    static func getNewArrivalsWithDecodable() -> [ProductData] {
        // 1. Doc file
        if let path = Bundle.main.path(forResource: "arrivals", ofType: "json") {
            do {
                // 2. Doc file tu duong dan
                let data: Data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
//                             print("[Debug] data \(data)")
//                             print("[Debug] ========================")
                // 3. Convert data => JSON
                
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                
                if let json = jsonResult as? JSON {
                    //                                print("[Debug] jsonResult \(jsonResult)")
                    //                                print("[Debug] json \(json)")
                    //                                print("[Debug] ========================")
                    if let dataArray = json["data"] as? JSONArray {
                        //                                        print("[Debug] dataArray \(dataArray)")
                        //                                        print("[Debug] ========================")
                        
                        var result: [ProductData] = []
                        
                        for i in 0..<dataArray.count {
                            let objectJSON: JSON = dataArray[i]
                            // Chuyen JSON thanh Data
                            if let jsonData = try? JSONSerialization.data(withJSONObject: objectJSON, options: .prettyPrinted),
                               let photoObject = try? JSONDecoder().decode(ProductData.self, from: jsonData) {
                                result.append(photoObject)
                            }
                        }
                        
                        return result
                    }
                }
                
            } catch {
                // handle error
            }
        }
        return []
    }
}
