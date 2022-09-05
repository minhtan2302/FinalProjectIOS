//
//  HistoryTableViewCell.swift
//  FinalIOS
//
//  Created by Tân Phù on 16/08/2022.
//

import UIKit

class OrderTransaction: Codable {
    var cartItems: [CardItem] = []
    var totalItems: Double = Double()
    var paymentDate: Date = Date()
    
    init(cartItems: [CardItem],totalItems: Double, paymentDate:Date) {
        self.cartItems = cartItems
        self.totalItems = totalItems
        self.paymentDate = paymentDate
    }
}

class HistoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dateHistory: UILabel!
    @IBOutlet weak var priceHistory: UILabel!
    @IBOutlet weak var historyView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        historyView.layer.cornerRadius = 15
        historyView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setDataOrder(data: OrderTransaction?) {
        if let data = data {
            priceHistory.text = "$\(data.totalItems)"
            dateHistory.text = "\(data.paymentDate)"
        }else {
            priceHistory.text = "$0.0"
            dateHistory.text = ""

        }
    }
}
