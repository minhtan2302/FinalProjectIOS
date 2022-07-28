//
//  DetaiProductViewController.swift
//  FinalIOS
//
//  Created by Tân Phù on 19/07/2022.
//

import UIKit

protocol ViewAmountDelegate{
    func didClick(view: DetaiProductViewController, number: Int)
}

struct DetailProductViewData {
    var imagePaths: [String]
    var nameTitle: String
    var type : String
    var desc : String
    var price : String
}

class DetaiProductViewController: UIViewController {
    
    // detai Product
    @IBOutlet weak var namePro: UILabel!
    @IBOutlet weak var subnamePro: UILabel!
    @IBOutlet weak var pricePro: UILabel!
    @IBOutlet weak var descriptionPro: UILabel!
        
    var viewData: DetailProductViewData? {
//        willSet {
//            viewData // gia tri
//            newValue
//        }
        didSet {
            print("DEBUG LOG: did set ViewData")
            updateView()
        }
    }
    
    var count = 1
    @IBAction func minusButton(_ sender: Any) {
        if count == 1 {
            return (count = 1)
        }else {
            count -= 1
            amountLabel.text = "\(count)"
        }
    }
    @IBAction func plusButton(_ sender: Any) {
        count += 1
        amountLabel.text = "\(count)"
    }
    //    var delegate: ViewAmountDelegate
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var detailCollectionView: UICollectionView!
    @IBOutlet weak var infoDetailView: UIView!
    @IBOutlet weak var rangeView: UIView!
    @IBOutlet weak var sizeButtonS: UIButton!
    @IBOutlet weak var sizeButtonM: UIButton!
    @IBOutlet weak var sizeButtonL: UIButton!
    @IBOutlet weak var sizeButtonXL: UIButton!
    @IBOutlet weak var sizeButtonXXL: UIButton!
    @IBOutlet weak var addToCartView: UIView!
    @IBOutlet weak var cartButton: UIView!
    @IBOutlet weak var indexProduct: UIView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var favoriteButtonView: UIView!
    @IBOutlet weak var backBlackButton: UIView!
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func addToCart(_ sender: Any) {
        let vc = CartViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func favoriteButton(_ sender: Any) {
        self.favoriteButtonView.backgroundColor = UIColor.red
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        
        detailCollectionView.dataSource = self
        detailCollectionView.delegate = self
        
        let nib = UINib (nibName: "HomeCollectionViewCell", bundle: .main)
        detailCollectionView.register(nib, forCellWithReuseIdentifier: "cell")
        
        // custom
        infoDetailView.layer.cornerRadius = 30.0
        infoDetailView.clipsToBounds = true
        
        rangeView.layer.cornerRadius = 30.0
        rangeView.clipsToBounds = true
        
        addToCartView.layer.cornerRadius = 20
        addToCartView.clipsToBounds = true
        
        indexProduct.layer.cornerRadius = 10
        indexProduct.clipsToBounds = true
        
        sizeButtonS.layer.cornerRadius = sizeButtonS.frame.width / 2
        sizeButtonM.layer.cornerRadius = sizeButtonM.frame.width / 2
        sizeButtonL.layer.cornerRadius = sizeButtonL.frame.width / 2
        sizeButtonXL.layer.cornerRadius = sizeButtonXL.frame.width / 2
        sizeButtonXXL.layer.cornerRadius = sizeButtonXXL.frame.width / 2
        cartButton.layer.cornerRadius = cartButton.frame.width / 2
        favoriteButtonView.layer.cornerRadius = favoriteButtonView.frame.width / 2
        backBlackButton.layer.cornerRadius = backBlackButton.frame.width / 2
        
        sizeButtonS.clipsToBounds = true
        sizeButtonM.clipsToBounds = true
        sizeButtonL.clipsToBounds = true
        sizeButtonXL.clipsToBounds = true
        sizeButtonXXL.clipsToBounds = true
        cartButton.clipsToBounds = true
        favoriteButtonView.clipsToBounds = true
        backBlackButton.clipsToBounds = true
        
        pageControl.currentPage = 2
        
        updateView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    
    func updateView() {
        if let viewData = viewData, isViewLoaded {
            // 1. Reload collection view
            detailCollectionView.reloadData()

            // 2. Load content data
            namePro.text = viewData.nameTitle
            subnamePro.text = viewData.type
            descriptionPro.text = viewData.desc
            pricePro.text = viewData.price
            
        }
    }

}
extension DetaiProductViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewData?.imagePaths.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeCollectionViewCell
        let index: Int = indexPath.row
        let imagePaths: String? = (viewData?.imagePaths[index])
        cell.setImage(name: imagePaths ?? "")
        return cell
        
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }
}

extension DetaiProductViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screen = UIScreen.main.bounds
        return CGSize(width: screen.width, height: screen.height - 418)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
