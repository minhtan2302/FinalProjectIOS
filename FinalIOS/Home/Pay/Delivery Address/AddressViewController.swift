//
//  AddressViewController.swift
//  FinalIOS
//
//  Created by Tân Phù on 25/07/2022.
//

import UIKit

class AddressViewController: UIViewController {

    @IBOutlet weak var backButtonView: UIView!
    @IBOutlet weak var addView: UIView!
    @IBOutlet weak var footerView: UIView!
    @IBOutlet weak var orderButton: UIButton!
    @IBOutlet weak var tabviewOrder: UITableView!
    @IBOutlet weak var totalProduct: UILabel!
    @IBAction func backPage(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func payOrder(_ sender: Any) {
        
        let vc = SuccessPayViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        
        orderItemManager.addHistory()
        cardItemManager.removeData()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabviewOrder.dataSource = self
        tabviewOrder.delegate = self
        
        let nib = UINib(nibName: "DeliveryTableViewCell", bundle: .main)
        tabviewOrder.register(nib, forCellReuseIdentifier: "cell")
        
        backButtonView.layer.cornerRadius = backButtonView.frame.width / 2
        backButtonView.clipsToBounds = true
        
        addView.layer.cornerRadius = 10
        addView.clipsToBounds = true
        
        orderButton.layer.cornerRadius = 15
        orderButton.clipsToBounds = true
        
        footerView.layer.cornerRadius = 15
        footerView.clipsToBounds = true
        
        totalProduct.text = "$\(cardItemManager.calculateTotalPrice())"
        
//        cardItemManager.getList()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
}

extension AddressViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DeliveryTableViewCell
        let cartItems: [CardItem] = cardItemManager.getList()
        let item: CardItem = cartItems[indexPath.row]
        cell.setData(data: item)
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cardItemManager.getList().count
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 115
    }
}
