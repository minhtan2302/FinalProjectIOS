//
//  DetaiProductViewController.swift
//  FinalIOS
//
//  Created by Tân Phù on 19/07/2022.
//

import UIKit

class DetaiProductViewController: UIViewController {
    
    // detai Product
    @IBOutlet weak var namePro: UILabel!
    @IBOutlet weak var subnamePro: UILabel!
    @IBOutlet weak var pricePro: UILabel!
    @IBOutlet weak var descriptionPro: UILabel!
    
    var viewData: ProductData? {
        
        //        willSet {
        //            viewData // gia tri
        //            newValue
        //        }
        didSet {
//            print("DEBUG LOG: did set ViewData")
            updateView()
        }
    }
    
    var count: Int = 1
    @IBAction func minusButton(_ sender: Any) {
        if count == 1 {
            return (count = 1)
        }else {
            count -= 1
            amountLabel.text = "\(count)"
            pricePro.text = "\((viewData?.priceProduct ?? 1) * Double(count))"
        }
    }
    @IBAction func plusButton(_ sender: Any) {
        count += 1
        amountLabel.text = "\(count)"
        pricePro.text = "\((viewData?.priceProduct ?? 1) * Double(count))"
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
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var backBlackButton: UIView!
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func nextToCart(_ sender: Any) {
        let vc = CartViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func addToCart(_ sender: Any) {
        if let viewData = viewData {
            let itemProduct: CardItem = CardItem(product: viewData, amout:  count)
            cardItemManager.addItem(item: itemProduct)
        }

        let vc = CartViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func favoriteButton(_ sender: Any) {
        
        if let viewData = viewData {
            let itemFavorite: FavoriteItem = FavoriteItem(productFavorite: viewData)
            favoriteItemManager.addFavorite(item: itemFavorite)
        }
        
        if (favoriteButtonView.backgroundColor == UIColor.white) {
            favoriteButtonView.backgroundColor = UIColor.red
            favoriteButton.backgroundColor = UIColor.red
        }
        else if (favoriteButtonView.backgroundColor == UIColor.red) {
            favoriteButtonView.backgroundColor = UIColor.white
            favoriteButton.backgroundColor = UIColor.white
        }
    }
    
    @IBAction func buttonSizeS(_ sender: Any) {
        if (sizeButtonS.backgroundColor == UIColor.white) {
            sizeButtonS.backgroundColor = UIColor.lightGray
        }
        else if (sizeButtonS.backgroundColor == UIColor.lightGray) {
            sizeButtonS.backgroundColor = UIColor.white
        }
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
        
        sizeButtonS.layer.borderWidth = 1
        sizeButtonM.layer.borderWidth = 1
        sizeButtonL.layer.borderWidth = 1
        sizeButtonXL.layer.borderWidth = 1
        sizeButtonXXL.layer.borderWidth = 1
        
        sizeButtonS.layer.borderColor = UIColor.darkGray.cgColor
        sizeButtonM.layer.borderColor = UIColor.darkGray.cgColor
        sizeButtonL.layer.borderColor = UIColor.darkGray.cgColor
        sizeButtonXL.layer.borderColor = UIColor.darkGray.cgColor
        sizeButtonXXL.layer.borderColor = UIColor.darkGray.cgColor
        
        cartButton.layer.cornerRadius = cartButton.frame.width / 2
        favoriteButtonView.layer.cornerRadius = favoriteButtonView.frame.width / 2
        backBlackButton.layer.cornerRadius = backBlackButton.frame.width / 2
        
        sizeButtonS.clipsToBounds = true
        sizeButtonM.clipsToBounds = true
        sizeButtonL.clipsToBounds = true
        sizeButtonXL.clipsToBounds = true
        sizeButtonXXL.clipsToBounds = true
        cartButton.clipsToBounds = true
        backBlackButton.clipsToBounds = true
        favoriteButtonView.clipsToBounds = true
        
        pageControl.currentPage = 2
        
        updateView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
        
            let object: FavoriteItem? = favoriteItemManager.productFavorite.first { subItem in
                subItem.productFavorite.id == viewData?.id
            }
            if let objectFavorite = object {
                favoriteButtonView.backgroundColor = UIColor.red
                favoriteButton.backgroundColor = UIColor.red
            }else {
                favoriteButtonView.backgroundColor = UIColor.white
                favoriteButton.backgroundColor = UIColor.white
            }
        
    }
    
    
    func updateView() {
        if let viewData = viewData, isViewLoaded {
            // 1 reload collection view
            detailCollectionView.reloadData()
            // 2. reload content data
            namePro.text = viewData.titleProduct
            subnamePro.text = viewData.subTitle
            pricePro.text = "\(viewData.priceProduct)"
            descriptionPro.text = viewData.description
        }
    }
    
}
extension DetaiProductViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewData?.imagePath.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeCollectionViewCell
        let index: Int = indexPath.row
        let imagePaths: String? = viewData?.imagePath[index]
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
