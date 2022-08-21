//
//  DetailHistoryViewController.swift
//  FinalIOS
//
//  Created by Tân Phù on 16/08/2022.
//

import UIKit

class DetailHistoryViewController: UIViewController {
    
    var dataHistory: OrderTransaction? {
        didSet {
            updateHistoryView()
        }
    }

    @IBOutlet weak var buttonBack: UIView!
    @IBOutlet weak var detailHistoryTable : UITableView!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        buttonBack.layer.cornerRadius = buttonBack.frame.width / 2
        buttonBack.clipsToBounds = true
        
        detailHistoryTable.delegate = self
        detailHistoryTable.dataSource = self
        
        let nib = UINib(nibName: "DetailHistoryTableViewCell", bundle: .main)
        detailHistoryTable.register(nib, forCellReuseIdentifier: "cell")
        
        updateHistoryView()
                
    }
    func updateHistoryView() {
        if isViewLoaded == true {
            if let dataHistory = dataHistory {
                dateLabel.text = "\(dataHistory.paymentDate)"
                detailHistoryTable.reloadData()
            }else {
                dateLabel.text = ""
            }
        }
    }
}
extension DetailHistoryViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataHistory?.cartItems.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DetailHistoryTableViewCell
        let itemHistory: [CardItem] = dataHistory!.cartItems
        let item: CardItem = itemHistory[indexPath.row]
        cell.setDataHistory(data: item)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
