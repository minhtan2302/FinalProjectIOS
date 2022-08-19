//
//  DataBanner.swift
//  FinalIOS
//
//  Created by Tân Phù on 21/07/2022.
//

import Foundation
final class BannerData {
    var imageBanner: String
    var titleBanner: String
    var discountBanner : String
    var codeBanner: String
    init(imageBanner: String, titleBanner: String, discountBanner: String, codeBanner: String) {
        self.imageBanner = imageBanner
        self.titleBanner = titleBanner
        self.discountBanner = discountBanner
        self.codeBanner = codeBanner
    }
    func mapToBannerCollectionViewCellViewData() -> BannerCollectionViewCellViewData {
        BannerCollectionViewCellViewData(image: imageBanner, title: titleBanner, discount: discountBanner, code: codeBanner)
    }
}
let imageBN: [String] = ["dior","prdd","gucci"]
    
extension BannerData {
    static func getData() -> [BannerData] {
        var datas: [BannerData] = []
        for i in 1...3 {
            let images = imageBN[i - 1]
            let data = BannerData(imageBanner: images, titleBanner: "", discountBanner: "", codeBanner: "")
            datas.append(data)
        }
        return datas
    }
}
