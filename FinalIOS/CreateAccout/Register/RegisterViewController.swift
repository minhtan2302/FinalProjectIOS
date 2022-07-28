//
//  RegisterViewController.swift
//  FinalIOS
//
//  Created by Tân Phù on 20/07/2022.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var userNameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var confirmPasswordText: UITextField!
    @IBOutlet weak var registerView: UIButton!
    @IBOutlet weak var backButton: UIView!
    @IBAction func registerButton(_ sender: Any) {
        let vc = SuccessViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func backButtonAction(_ sender: Any) { 
        self.navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        registerView.layer.cornerRadius = 15.0
        registerView.clipsToBounds = true
        
        backButton.layer.cornerRadius = backButton.frame.width/2
        backButton.clipsToBounds = true
    }

}
