//
//  CartViewController.swift
//  FinalIOS
//
//  Created by Tân Phù on 20/07/2022.
//

import UIKit

class CartViewController: UIViewController {
    
    @IBOutlet weak var backMiniView: UIView!
    @IBOutlet weak var proceedView: UIView!
    @IBOutlet weak var nextMiniView: UIView!
    @IBOutlet weak var tableCart: UITableView!
    @IBOutlet weak var totalLabel: UILabel!
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
        
        nextMiniView.layer.cornerRadius = nextMiniView.frame.width / 2
        nextMiniView.clipsToBounds = true
        
        proceedView.layer.cornerRadius = 10
        proceedView.clipsToBounds = true
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableCart.reloadData()
        totalLabel.text = "$\(cardItemManager.calculateTotalPrice())"

    }
    
}
extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cardItemManager.getList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CartTableViewCell
        let cardItems: [CardItem] = cardItemManager.getList()
        let item: CardItem = cardItems[indexPath.row]
        cell.setData(data: item)
        cell.delegate = self
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 115
    }
}

extension CartViewController: CartViewDelegate{
    func didClick(view: CartTableViewCell, amout: Int, price: Double) {
        print("Count \(amout)")
    }
}
