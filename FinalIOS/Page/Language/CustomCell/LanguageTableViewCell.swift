//
//  LanguageTableViewCell.swift
//  FinalIOS
//
//  Created by Tân Phù on 22/07/2022.
//

import UIKit

class LanguageTableViewCell: UITableViewCell {

    @IBOutlet weak var imageCountry: UIImageView!
    @IBOutlet weak var viewLanguage: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBAction func clickButton(_ sender: Any) {
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        imageCountry.layer.cornerRadius = imageCountry.frame.width/2
        imageCountry.clipsToBounds = true
        
        viewLanguage.layer.cornerRadius = 15
        viewLanguage.clipsToBounds = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
