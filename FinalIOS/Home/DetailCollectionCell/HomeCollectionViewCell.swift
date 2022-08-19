//
//  HomeCollectionViewCell.swift
//  FinalIOS
//
//  Created by Tân Phù on 20/07/2022.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
        
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setImage(name: String) {
        imageView.downloaded(from: name, completion: nil)
//        imageView.image = UIImage(named: name)
    }

}
