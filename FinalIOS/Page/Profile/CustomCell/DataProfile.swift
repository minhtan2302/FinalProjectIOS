//
//  DataProfile.swift
//  FinalIOS
//
//  Created by Tân Phù on 22/07/2022.
//

import Foundation
final class DataProfile {
    var imageLogo: String
    var namePro: String
    init(imageLogo: String, namePro: String) {
        self.namePro = namePro
        self.imageLogo = imageLogo
    }
}
let imageProfile : [String] = ["in1","in2","in3","in4"]
let nameProfile: [String] = ["Personal Details","My Order","My Favourites","Settings"]
extension DataProfile {
    static func getData() -> [DataProfile]{
        var datas: [DataProfile] = []
        for i in 1...4 {
            let img = imageProfile[i-1]
            let name = nameProfile[i-1]
            let data = DataProfile(imageLogo: img, namePro: name)
            datas.append(data)
        }
        return datas
    }
}
