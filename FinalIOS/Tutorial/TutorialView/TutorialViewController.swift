//
//  TutorialViewController.swift
//  FinalIOS
//
//  Created by Tân Phù on 20/07/2022.
//

import UIKit

class TutorialViewController: UIViewController {

    var datas: [DataTutorial] = DataTutorial.getData()
    
    @IBOutlet weak var tutorialCollection: UICollectionView!
    @IBOutlet weak var pageControl : UIPageControl!
    @IBOutlet weak var nextButtonView : UIView!
    @IBAction func nextToButton(_ sender: Any) {
        let vc = WelcomeViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        
        tutorialCollection.dataSource = self
        tutorialCollection.delegate = self
        
        let nib = UINib(nibName: "CustomTutorialCollectionViewCell", bundle: .main)
        tutorialCollection.register(nib, forCellWithReuseIdentifier: "cell")
        
        pageControl.currentPage = 0
        
        nextButtonView.layer.cornerRadius = nextButtonView.frame.width/2
        nextButtonView.clipsToBounds = true
        
    }
}
extension TutorialViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datas.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomTutorialCollectionViewCell
        let item = datas[indexPath.row]
        cell.titleLabel.text = item.title
        cell.subTitleLabel.text = item.subTitle
        cell.imageTutorial.image = UIImage(named: item.img)
        cell.decLabel.text = item.des
        return cell
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }
}
extension TutorialViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds
        return CGSize(width: screenWidth.width, height: screenWidth.height-68)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
