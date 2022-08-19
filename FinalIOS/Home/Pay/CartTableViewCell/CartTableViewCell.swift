//
//  CartTableViewCell.swift
//  FinalIOS
//
//  Created by Tân Phù on 20/07/2022.
//

import UIKit

class CardItem {
    var product: ProductData
    var amout: Int
    
    init(product: ProductData, amout: Int) {
        self.product = product
        self.amout = amout
    }
}

protocol CartViewDelegate{
    func didClick(view: CartTableViewCell, amout: Int, price: Double)
}

class CartTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellCartView: UIView!
    @IBOutlet weak var rangerView: UIView!
    @IBOutlet weak var imageProduct: UIImageView!
    @IBOutlet weak var nameProduct: UILabel!
    @IBOutlet weak var subNameProduct: UILabel!
    @IBOutlet weak var priceProduct: UILabel!
    @IBOutlet weak var amountProduct: UILabel!
    
    var delegate: CartViewDelegate?
    var index: Int = 1

    @IBAction func plusButton(_ sender: Any) {
        
        index += 1
        if let delegate = delegate {
            delegate.didClick(view: self, amout: index, price: 0.0)
            amountProduct.text = "\(index)"
            
        }
    }
    @IBAction func minusButton(_ sender: Any) {
        if index == 1 {
            return amountProduct.text = "\(1)"
        }else {
            index -= 1
            if let delegate = delegate {
                delegate.didClick(view: self, amout: index, price: 0.0)
                amountProduct.text = "\(index)"
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cellCartView.layer.cornerRadius = 13.0
        cellCartView.clipsToBounds = true
        
        imageProduct.layer.cornerRadius = 13.0
        imageProduct.clipsToBounds = true
        
        rangerView.layer.cornerRadius = 15.0
        rangerView.clipsToBounds = true
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setData(data: CardItem?) {
        imageProduct.downloaded(from: data!.product.imageProduct, completion: nil)
        nameProduct.text = data?.product.titleProduct ?? ""
        subNameProduct.text = data?.product.subTitle ?? ""
        priceProduct.text = "$\((data?.product.priceProduct ?? 0.0) * Double(data?.amout ?? 1))"
        amountProduct.text = "\(data?.amout ?? 1)"
        
    }
    
    
}
