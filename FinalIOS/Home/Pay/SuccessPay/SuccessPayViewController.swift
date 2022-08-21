//
//  SuccessPayViewController.swift
//  FinalIOS
//
//  Created by Tân Phù on 22/07/2022.
//

import UIKit

class SuccessPayViewController: UIViewController {

    @IBOutlet weak var continueView: UIButton!
    @IBAction func continuewButton(_ sender: Any) {
        let controllers = self.navigationController?.viewControllers
                 for vc in controllers! {
                   if vc is HomeViewController {
                     _ = self.navigationController?.popToViewController(vc as! HomeViewController, animated: true)
                   }
                }
//        cardItemManager.deleteItem()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        continueView.layer.cornerRadius = 15
        continueView.clipsToBounds = true
    }

}
