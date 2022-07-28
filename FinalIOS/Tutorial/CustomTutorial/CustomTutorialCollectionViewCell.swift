//
//  CustomTutorialCollectionViewCell.swift
//  FinalIOS
//
//  Created by Tân Phù on 21/07/2022.
//

import UIKit

class CustomTutorialCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageTutorial: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var decLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageTutorial.layer.cornerRadius = 15
        imageTutorial.clipsToBounds = true
    }

}
