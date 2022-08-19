//
//  DataCollection1.swift
//  FinalIOS
//
//  Created by Tân Phù on 20/07/2022.
//

import Foundation
final class DataCollection {
    var image: String
    init(image:String){
        self.image = image
    }
//    func 
}
extension DataCollection {
    static func getData() -> [DataCollection] {
        var datas: [DataCollection] = []
        for i in 1...3 {
            let data = DataCollection(image: "")
            datas.append(data)
        }
        return datas
    }
}

