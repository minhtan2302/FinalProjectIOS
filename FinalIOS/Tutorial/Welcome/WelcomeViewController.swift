//
//  WelcomeViewController.swift
//  FinalIOS
//
//  Created by Tân Phù on 21/07/2022.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var buttonSignUp: UIButton!
    @IBOutlet weak var buttonLogin: UIButton!
    @IBAction func nextPageLogin(_ sender: Any) {
        let vc = LoginViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func nextPageSign(_ sender: Any) {
        let vc = RegisterViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.isNavigationBarHidden = true
        buttonSignUp.layer.borderWidth = 2
        buttonSignUp.layer.borderColor = UIColor.black.cgColor
        buttonSignUp.layer.cornerRadius = 15
        buttonLogin.layer.cornerRadius = 15
        buttonSignUp.clipsToBounds = true
        buttonLogin.clipsToBounds = true
        
    }

}
