//
//  ProfileViewController.swift
//  FinalIOS
//
//  Created by Tân Phù on 22/07/2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var datas: [DataProfile] = DataProfile.getData()
    
    @IBOutlet weak var backButton: UIView!
    @IBOutlet weak var settingButton: UIView!
    @IBOutlet weak var bannerProfile: UIView!
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var tableProfile: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = true
        
        backButton.layer.cornerRadius = backButton.frame.width / 2
        backButton.clipsToBounds = true
        
        settingButton.layer.cornerRadius = settingButton.frame.width / 2
        settingButton.clipsToBounds = true
        
        bannerProfile.layer.cornerRadius = 15
        bannerProfile.clipsToBounds = true
        
        imgUser.layer.cornerRadius = 15
        imgUser.clipsToBounds = true
        
        tableProfile.delegate = self
        tableProfile.dataSource = self
        
        let nib = UINib(nibName: "ProfileTableViewCell", bundle: .main)
        tableProfile.register(nib, forCellReuseIdentifier: "cell")

    }
}
extension ProfileViewController : UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProfileTableViewCell
        let data = datas[indexPath.row]
        cell.imageIf.image = UIImage(named: data.imageLogo)
        cell.nameLabel.text = data.namePro
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
}
