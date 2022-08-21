//
//  HistoryViewController.swift
//  FinalIOS
//
//  Created by Tân Phù on 27/07/2022.
//

import UIKit

class HistoryViewController: UIViewController {

    @IBOutlet weak var buttonBack: UIView!
    @IBOutlet weak var historyTable : UITableView!
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true

        buttonBack.layer.cornerRadius = buttonBack.frame.width / 2
        buttonBack.clipsToBounds = true
        
        historyTable.delegate = self
        historyTable.dataSource = self
        
        let nib = UINib(nibName: "HistoryTableViewCell", bundle: .main)
        historyTable.register(nib, forCellReuseIdentifier: "cell")
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        historyTable.reloadData()
    }
}
extension HistoryViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderItemManager.listOrder().count
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HistoryTableViewCell
        let orderItems: [OrderTransaction] = orderItemManager.listOrder()
        let item: OrderTransaction = orderItems[indexPath.row]
        cell.setDataOrder(data: item)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dataHistorys: [OrderTransaction] = orderItemManager.listOrder()
        let item: OrderTransaction = dataHistorys[indexPath.row]
        let vc = DetailHistoryViewController()
        vc.dataHistory = item
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
