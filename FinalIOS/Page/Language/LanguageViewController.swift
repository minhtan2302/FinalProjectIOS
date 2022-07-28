//
//  LanguageViewController.swift
//  FinalIOS
//
//  Created by Tân Phù on 22/07/2022.
//

import UIKit

class LanguageViewController: UIViewController {

    var datas: [DataLanguage] = DataLanguage.getData()
    @IBOutlet weak var buttonBack: UIView!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var tableLanguage: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonBack.layer.cornerRadius = buttonBack.frame.width / 2
        buttonBack.clipsToBounds = true
        
        searchView.layer.borderWidth = 2
        searchView.layer.borderColor = UIColor.gray.cgColor
        searchView.layer.cornerRadius = 15
        searchView.clipsToBounds = true
        
        tableLanguage.delegate = self
        tableLanguage.dataSource = self
        
        let nib = UINib(nibName: "LanguageTableViewCell", bundle: .main)
        tableLanguage.register(nib, forCellReuseIdentifier: "cell")
    }
}
extension LanguageViewController: UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! LanguageTableViewCell
        let data = datas[indexPath.row]
        cell.imageCountry.image = UIImage(named: data.imageLanguage )
        cell.nameLabel.text = data.nameLanguage
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
