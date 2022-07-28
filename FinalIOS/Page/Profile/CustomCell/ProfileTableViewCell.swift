//
//  ProfileTableViewCell.swift
//  FinalIOS
//
//  Created by Tân Phù on 22/07/2022.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var viewProFile: UIView!
    @IBOutlet weak var imageBorder: UIView!
    @IBOutlet weak var imageIf: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewProFile.layer.cornerRadius = 15
        viewProFile.clipsToBounds = true
        
        imageBorder.layer.cornerRadius = 15
        imageBorder.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
