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
    @IBAction func backPage(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func payOrder(_ sender: Any) {
        let vc = SuccessPayViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backButtonView.layer.cornerRadius = backButtonView.frame.width / 2
        backButtonView.clipsToBounds = true
        
        addView.layer.cornerRadius = 10
        addView.clipsToBounds = true
        
        orderButton.layer.cornerRadius = 15
        orderButton.clipsToBounds = true
        
        footerView.layer.cornerRadius = 15
        footerView.clipsToBounds = true
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
}
