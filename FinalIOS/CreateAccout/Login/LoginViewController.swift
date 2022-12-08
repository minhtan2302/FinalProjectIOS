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

    var email: String = ""
    var password: String = ""
    
    @IBAction func loginButton(_ sender: Any) {
        
        if let errorMessage = verifyLogin() {
            SharedClass.sharedInstance.alert(view: self, title: "Error", message: "Can not login because got err \(errorMessage)")
        } else {
            UIApplication.appDelegate?.moveToHome()
        }
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

    @IBAction func textEditingDidEnd(_ sender: UITextField) {
        let tag = sender.tag
        guard let value = sender.text else { return }
        switch tag {
        case 0: email = value
        case 1: password = value
        default: break
        }
    }

    private func verifyLogin() -> String? {
        
        if email.isEmpty {
            SharedClass.sharedInstance.alert(view: self, title: "Error", message: "Please input your email!")
        }
        
        if password.isEmpty {
            SharedClass.sharedInstance.alert(view: self, title: "Error", message: "Please input your password!")

        }
        
        let registeredUsers: [RegisterInfo] = UserDefaultAccessor.shared.getObjects(type: RegisterInfo.self, key: UserDefaultKeys.registeredUsers)
        let object = registeredUsers.filter { info in
            info.email == email && info.password == password
        }.first
        
        if let object_ = object {
            userIsLoggin = object_
            return nil
        } else {
            SharedClass.sharedInstance.alert(view: self, title: "Error", message: "Account has not registerd yet")
            return "Account has not registerd yet"

        }

    }
}


