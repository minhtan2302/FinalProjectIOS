//
//  FavouritesViewController.swift
//  FinalIOS
//
//  Created by Tân Phù on 12/08/2022.
//

import UIKit

class FavouritesViewController: UIViewController {
    
    @IBOutlet weak var buttonBack: UIView!
    @IBOutlet weak var favouriteTable : UITableView!

    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        buttonBack.layer.cornerRadius = buttonBack.frame.width / 2
        buttonBack.clipsToBounds = true
        
        favouriteTable.delegate = self
        favouriteTable.dataSource = self
        
        let nib = UINib(nibName: "DeliveryTableViewCell", bundle: .main)
        favouriteTable.register(nib, forCellReuseIdentifier: "cell")
    }
}
extension FavouritesViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteItemManager.listFavorite().count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DeliveryTableViewCell
        let item: FavoriteItem = favoriteItemManager.listFavorite()[indexPath.row]
        cell.setDataFavourite(data: item)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 115
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetaiProductViewController()
        let item: FavoriteItem = favoriteItemManager.listFavorite()[indexPath.row]
        vc.viewData = item.productFavorite
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
