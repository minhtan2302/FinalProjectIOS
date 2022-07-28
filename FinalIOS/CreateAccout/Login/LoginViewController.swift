//
//  LoginViewController.swift
//  FinalIOS
//
//  Created by Tân Phù on 20/07/2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailLoginText: UITextField!
    @IBOutlet weak var passwordLoginText: UITextField!
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var faceView: UIView!
    @IBOutlet weak var googleView: UIView!
    @IBOutlet weak var appleView: UIView!
    @IBOutlet weak var backButton: UIView!

    @IBAction func loginButton(_ sender: Any) {
        let vc = HomeViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginView.layer.cornerRadius = 15.0
        faceView.layer.cornerRadius = 15.0
        googleView.layer.cornerRadius = 15.0
        appleView.layer.cornerRadius = 15.0
        backButton.layer.cornerRadius = backButton.frame.width / 2

        loginView.clipsToBounds = true
        faceView.clipsToBounds = true
        googleView.clipsToBounds = true
        appleView.clipsToBounds = true
        backButton.clipsToBounds = true


    }


}
