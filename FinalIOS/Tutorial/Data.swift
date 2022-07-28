//
//  Data.swift
//  FinalIOS
//
//  Created by Tân Phù on 20/07/2022.
//

import Foundation
final class DataTutorial {

    var img: String
    var title: String
    var subTitle: String
    var des: String
    
    init (subTitle: String, des: String, img: String,title: String ) {
        self.des = des
        self.img = img
        self.subTitle = subTitle
        self.title = title
    }
}

    var imgs: [String] = ["tt-1","tt-2","tt-3"]
    var titles: [String] = ["20% Discount",
                               "Take Advantage",
                               "All Types Offers"]
    var subTitles: [String] = ["New Arrival Product",
                            "Of The Offer Shopping",
                            "Within Your Reach"]
    var desS : [String] = ["Publish up your selfies to make yourself more beautiful with this app",
                           "Publish up your selfies to make yourself more beautiful with this app",
                           "Publish up your selfies to make yourself more beautiful with this app"]


extension DataTutorial {
    static func getData() -> [DataTutorial] {
        var datas: [DataTutorial] = []
        for i in 1...3 {
            let image = imgs[i - 1]
            let titleName = titles[i - 1]
            let subTitle = subTitles[i - 1]
            let des = desS[i - 1]
            let data = DataTutorial(subTitle: subTitle, des: des, img: image, title: titleName)
            datas.append(data)
        }
        return datas
    }
}
