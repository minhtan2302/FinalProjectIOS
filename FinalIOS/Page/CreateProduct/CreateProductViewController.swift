

import UIKit

class CreateProductViewController: UIViewController {

    
    @IBOutlet weak var viewCreate1: UIView!
    @IBOutlet weak var viewCreate2: UIView!
    @IBOutlet weak var viewCreate3: UIView!
    @IBOutlet weak var viewCreate4: UIView!
    @IBOutlet weak var viewCreate5: UIView!
    @IBOutlet weak var viewCreate6: UIView!
    @IBOutlet weak var viewCreate7: UIView!
    @IBOutlet weak var button: UIButton!

    @IBAction func createButton(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = false
        
        viewCreate1.layer.cornerRadius = 10
        viewCreate2.layer.cornerRadius = 10
        viewCreate3.layer.cornerRadius = 10
        viewCreate4.layer.cornerRadius = 10
        viewCreate5.layer.cornerRadius = 10
        viewCreate6.layer.cornerRadius = 10
        viewCreate7.layer.cornerRadius = 10
        button.layer.cornerRadius = 20

        viewCreate1.clipsToBounds = true
        viewCreate2.clipsToBounds = true
        viewCreate3.clipsToBounds = true
        viewCreate4.clipsToBounds = true
        viewCreate5.clipsToBounds = true
        viewCreate6.clipsToBounds = true
        viewCreate7.clipsToBounds = true
        button.clipsToBounds = true


    }

}
