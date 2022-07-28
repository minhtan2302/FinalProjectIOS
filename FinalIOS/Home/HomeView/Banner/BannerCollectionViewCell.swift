//
//  BannerCollectionViewCell.swift
//  FinalIOS
//
//  Created by Tân Phù on 21/07/2022.
//

import UIKit

struct BannerCollectionViewCellViewData {
    var image: String
    var title: String
    var discount: String
    var code: String
}

class BannerCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageBack: UIImageView!
    @IBOutlet weak var bannerView: UIView!
    @IBOutlet weak var discountLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var getButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageBack.layer.cornerRadius = 15.0
        imageBack.clipsToBounds = true
        
        getButton.layer.cornerRadius = 10.0
        getButton.clipsToBounds = true
    }
    func updateDataBanner(data:BannerCollectionViewCellViewData?) {
        imageBack.image = UIImage(named: data?.image ?? "")
        titleLabel.text = data?.title
        discountLabel.text = data?.discount
        codeLabel.text = data?.code
    }
}
