//
//  HomeViewController.swift
//  FinalIOS
//
//  Created by Tân Phù on 21/07/2022.
//

import UIKit

class HomeViewController: UIViewController {

    var bannerData: [BannerData] = BannerData.getData()
//    var productData: [ProductData] = ApiService.getNewArrivals()
    var productData: [ProductData] = ApiService.getNewArrivalsWithDecodable()
    
    @IBOutlet weak var menuButton: UIImageView!
    @IBOutlet weak var avatarUser: UIImageView!
    @IBOutlet weak var searchBar: UIView!
    @IBOutlet weak var textSearch: UITextField!
    @IBOutlet weak var switchButton: UIImageView!
    @IBOutlet weak var bannerCollection: UICollectionView!
    @IBOutlet weak var productCollection: UICollectionView!
    @IBOutlet weak var scrollViewHome: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        
        
        productCollection.delegate = self
        productCollection.dataSource = self
        
        bannerCollection.delegate = self
        bannerCollection.dataSource = self
        
        scrollViewHome.delegate = self
        
        
        // banner
        let nibBanner = UINib(nibName: "BannerCollectionViewCell", bundle: .main)
        bannerCollection.register(nibBanner, forCellWithReuseIdentifier: "cellBanner")
        // product
        let nibProduct = UINib(nibName: "ProductCollectionViewCell", bundle: .main)
        productCollection.register(nibProduct, forCellWithReuseIdentifier: "cellProduct")
        
        searchBar.layer.cornerRadius = 15.0
        searchBar.clipsToBounds = true
        
        menuButton.layer.cornerRadius = menuButton.frame.width / 4
        menuButton.clipsToBounds = true
        
        avatarUser.layer.cornerRadius = avatarUser.frame.width / 2
        avatarUser.clipsToBounds = true
        
        switchButton.layer.cornerRadius = switchButton.frame.width / 4
        switchButton.clipsToBounds = true
        
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    // Product
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == productCollection {
            return productData.count

        } else {
            return bannerData.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == productCollection {
            let cellProduct = productCollection.dequeueReusableCell(withReuseIdentifier: "cellProduct", for: indexPath) as! ProductCollectionViewCell
            let item: ProductData = productData[indexPath.row]
            let viewData = ProductCollectionViewCellViewData.init(id:item.id,image: item.imageProduct, name: item.titleProduct, type: item.subTitle, price: item.priceProduct)
            cellProduct.updateData(data: viewData)
            
            return cellProduct
        } else {
            let cellBanner = bannerCollection.dequeueReusableCell(withReuseIdentifier: "cellBanner", for: indexPath) as! BannerCollectionViewCell
            let item = bannerData[indexPath.row]
            let bannerData = BannerCollectionViewCellViewData.init(image: item.imageBanner, title: item.titleBanner, discount: item.discountBanner, code: item.codeBanner)
            cellBanner.updateDataBanner(data: bannerData)
            
            return cellBanner
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == productCollection {
            let item: ProductData = productData[indexPath.row]
            let vc = DetaiProductViewController()
            vc.viewData = item
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        view.endEditing(true)
    }
}
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == productCollection {
            return CGSize(width: 172, height: 240)
        }else {
            return CGSize(width: 260 , height: 160)
        }
    }
}


