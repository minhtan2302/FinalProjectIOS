//
//  DataLanguage.swift
//  FinalIOS
//
//  Created by Tân Phù on 22/07/2022.
//

import Foundation
final class DataLanguage {
    var imageLanguage: String
    var nameLanguage : String
    init (imageLanguage: String, nameLanguage: String) {
        self.imageLanguage = imageLanguage
        self.nameLanguage = nameLanguage
    }
}
let img: [String] = ["lg-1","lg-2"]
let nameL: [String] = ["Việt Nam", "English"]
extension DataLanguage {
    static func getData() -> [DataLanguage] {
        var datas: [DataLanguage] = []
        for i in 1...2 {
            let image = img[i-1]
            let name = nameL[i-1]
            let data = DataLanguage(imageLanguage: image, nameLanguage: name)
                             datas.append(data)
        }
                             return datas
    }
}
