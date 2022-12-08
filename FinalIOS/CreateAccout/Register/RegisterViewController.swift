//
//  RegisterViewController.swift
//  FinalIOS
//
//  Created by Tân Phù on 20/07/2022.
//

import UIKit

struct RegisterInfo: Codable {
    var username: String = ""
    var email: String = ""
    var phone: String = ""
    var address: String = ""
    var password: String = ""
    var confirmPw: String = ""
    
    @discardableResult
    mutating func updateUsername(value: String) -> Self {
        self.username = value
        return self
    }
    
    @discardableResult
    mutating func updateEmail(value: String) -> Self {
        self.email = value
        return self
    }
    
    @discardableResult
    mutating func updatePhone(value: String) -> Self {
        self.phone = value
        return self
    }
    
    @discardableResult
    mutating func updateAddress(value: String) -> Self {
        self.address = value
        return self
    }
    
    @discardableResult
    mutating func updatePassword(value: String) -> Self {
        self.password = value
        return self
    }
    
    @discardableResult
    mutating func updateConfirmPW(value: String) -> Self {
        self.confirmPw = value
        return self
    }
    
    func validate() -> String? {
        if username.isEmpty {
            return "Please input your username!"
        }
        
        if email.isEmpty {
            return "Please input your email!"
        }
        
        if phone.isEmpty {
            return "Please input your phone!"
        }
        
        if address.isEmpty {
            return "Please input your address!"
        }
        
        if password.isEmpty {
            return "Please input your password!"
        }
        
        if confirmPw.isEmpty {
            return "Please input your confirm password!"
        }
        
        if !password.elementsEqual(confirmPw) {
            return "The confirm password is not match with password!"
        }
        
        return nil
    }
}

struct UserDefaultKeys {
    static let registeredUsers = "REGISTERED_USERS"
}

class RegisterViewController: UIViewController {

    enum InputFields: Int {
        case username
        case email
        case phone
        case address
        case password
        case confirmPw
    }
    
    @IBOutlet weak var userNameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var phoneText: UITextField!
    @IBOutlet weak var addressText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var confirmPasswordText: UITextField!
    @IBOutlet weak var registerView: UIButton!
    @IBOutlet weak var backButton: UIView!
    private var registerInfo = RegisterInfo()
    
    @IBAction func registerButton(_ sender: Any) {
        let error = registerInfo.validate()
        
        if let error = error {
            // Show loi len
            print("GOT ERROR \(error.description)")
        } else {
            // Lay thong tin danh sach user da dang ky truoc do
            var listUsers = UserDefaultAccessor.shared.getObjects(type: RegisterInfo.self, key: UserDefaultKeys.registeredUsers)
            // Them user vua dang ky vao danh sach
            listUsers.append(registerInfo)
            // Luu danh sach gom user moi dang ky vao
            UserDefaultAccessor.shared.saveObjects(listUsers, forKey: UserDefaultKeys.registeredUsers)
            userIsLoggin = registerInfo

            let vc = SuccessViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
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
    
    
    @IBAction func textEditingDidEnd(_ sender: UITextField) {
        let tag = sender.tag
        guard let inputField = InputFields(rawValue: tag) else { return }
        guard let value = sender.text else { return }
        
        switch inputField {
        case .username: registerInfo.updateUsername(value: value)
        case .email: registerInfo.updateEmail(value: value)
        case .phone: registerInfo.updatePhone(value: value)
        case .address: registerInfo.updateAddress(value: value)
        case .password: registerInfo.updatePassword(value: value)
        case .confirmPw: registerInfo.updateConfirmPW(value: value)
        }
    }
}
