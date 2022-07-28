//
//  SuccessViewController.swift
//  FinalIOS
//
//  Created by Tân Phù on 22/07/2022.
//

import UIKit

class SuccessViewController: UIViewController {

    @IBOutlet weak var startLoginButton: UIButton!
    
    @IBAction func startLogin(_ sender: Any) {
        let vc = LoginViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startLoginButton.layer.cornerRadius = 15
        startLoginButton.clipsToBounds = true
    }
}
