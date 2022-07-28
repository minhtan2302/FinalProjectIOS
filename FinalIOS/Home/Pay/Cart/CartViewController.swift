//
//  CartViewController.swift
//  FinalIOS
//
//  Created by Tân Phù on 20/07/2022.
//

import UIKit

class CartViewController: UIViewController {

    var names: [String] = ["Tí",
                                  "Tèo",
                                  "Hùng",
                                  "Lam",
                                  "Thuỷ",
                                  "Tuấn",
                                  "Trung",
                                  "Hạnh"]
    
    @IBOutlet weak var cartMiniView: UIView!
    @IBOutlet weak var backMiniView: UIView!
    @IBOutlet weak var discoutView: UIView!
    @IBOutlet weak var proceedView: UIView!
    @IBOutlet weak var nextMiniView: UIView!
    @IBOutlet weak var tableCart: UITableView!
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func processtoCheck(_ sender: Any) {
        let vc = AddressViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = true
        
        tableCart.delegate = self
        tableCart.dataSource = self
        
        tableCart.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
       
        let nib = UINib(nibName: "CartTableViewCell", bundle: .main)
        tableCart.register(nib, forCellReuseIdentifier: "cell")
        
        backMiniView.layer.cornerRadius = backMiniView.frame.width / 2
        backMiniView.clipsToBounds = true
        
        cartMiniView.layer.cornerRadius = cartMiniView.frame.width / 2.0
        cartMiniView.clipsToBounds = true
        
        nextMiniView.layer.cornerRadius = nextMiniView.frame.width / 2.0
        nextMiniView.clipsToBounds = true
        
        discoutView.layer.cornerRadius = 10.0
        discoutView.clipsToBounds = true
        
        proceedView.layer.cornerRadius = 10.0
        proceedView.clipsToBounds = true
        
    }

}
extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CartTableViewCell
        
        cell.nameProduct.text = names[indexPath.row]
        cell.imageProduct.image = UIImage(named: "img1")
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 115
    }
}
