//
//  ProfileViewController.swift
//  FinalIOS
//
//  Created by Tân Phù on 22/07/2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var datas: [DataProfile] = DataProfile.getData()
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var backButton: UIView!
    @IBOutlet weak var bannerProfile: UIView!
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var historyView: UIView!
    @IBOutlet weak var favouritView: UIView!
    @IBOutlet weak var settingView: UIView!
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var profileImg: UIView!
    @IBOutlet weak var historyImg: UIView!
    @IBOutlet weak var favouritImg: UIView!
    @IBOutlet weak var settingImg: UIView!

    @IBAction func personalButton(_ sender: Any) {
    }
    @IBAction func historyButton(_ sender: Any) {
        let vc = HistoryViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func favouritesButton(_ sender: Any) {
        let vc = FavouritesViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func setttingButton(_ sender: Any) {
        let vc = LanguageViewController()
        self.navigationController?.pushViewController(vc, animated: true)

    }
    //    @IBOutlet weak var tableProfile: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = true
        
        usernameLabel.text = userIsLoggin?.username
        emailLabel.text = userIsLoggin?.email
        
        backButton.layer.cornerRadius = backButton.frame.width / 2
        backButton.clipsToBounds = true
        
        bannerProfile.layer.cornerRadius = 15
        bannerProfile.clipsToBounds = true
        
        imgUser.layer.cornerRadius = 15
        imgUser.clipsToBounds = true
        
        profileView.layer.cornerRadius = 15
        historyView.layer.cornerRadius = 15
        favouritView.layer.cornerRadius = 15
        settingView.layer.cornerRadius = 15
        profileView.clipsToBounds = true
        historyView.clipsToBounds = true
        favouritView.clipsToBounds = true
        settingView.clipsToBounds = true
        
        profileImg.layer.cornerRadius = 15
        historyImg.layer.cornerRadius = 15
        favouritImg.layer.cornerRadius = 15
        settingImg.layer.cornerRadius = 15
        profileImg.clipsToBounds = true
        favouritImg.clipsToBounds = true
        settingImg.clipsToBounds = true
        historyImg.clipsToBounds = true
        
        
        
//        tableProfile.delegate = self
//        tableProfile.dataSource = self
//
//        let nib = UINib(nibName: "ProfileTableViewCell", bundle: .main)
//        tableProfile.register(nib, forCellReuseIdentifier: "cell")

    }
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
}
//extension ProfileViewController : UITableViewDelegate, UITableViewDataSource{
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return datas.count
//    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProfileTableViewCell
//        let data = datas[indexPath.row]
//        cell.imageIf.image = UIImage(named: data.imageLogo)
//        cell.nameLabel.text = data.namePro
//        return cell
//    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 75
//    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
//}
