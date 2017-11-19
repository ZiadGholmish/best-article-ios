//
//  WebsitesVC.swift
//  Best Articles
//
//  Created by Ziad Gholmish on 11/14/17.
//  Copyright © 2017 Ziad Gholmish. All rights reserved.
//

import UIKit

class WebsitesVC: UIViewController , APIManagerWebsitesDelegate , TabSelectedDelegate , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var websitesCollectionView: UICollectionView!
    
    var websites: [WebsiteModel]  = []
    let cellId = "WebsiteCell"
    
    @IBOutlet weak var contentLoading: UIActivityIndicatorView!
    lazy var websitesTab: TabLayout = {
        let cTab = TabLayout()
        cTab.translatesAutoresizingMaskIntoConstraints = false
        cTab.tabSeelctedDelegate = self
        return cTab
    }()
    
    override func viewDidLoad() {
         super.viewDidLoad()
        contentLoading.isHidden = false
        setupTabLayout()
        websitesCollectionView.dataSource = self
        websitesCollectionView.delegate = self
        let apiManager = APIManager.init()
        apiManager.websitesDelagate = self
        apiManager.getWebsites()
    }
    
    
    func setupTabLayout() {
        view.addSubview(websitesTab)
        let views = ["v0" : websitesTab]
        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics:nil, views: views)
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat:
            "V:|-30-[v0(50)]|", options: [], metrics:nil, views: views)
        view.addConstraints(horizontalConstraints)
        view.addConstraints(verticalConstraints)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return websites.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId ,
                                                         for: indexPath) as? WebsiteCell {
            let websiteModel = websites[indexPath.row]
            cell.setArticlesForPage(website: websiteModel)
            return cell
            
        }else{
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height:  view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func itemSelected(positoin: Int) {
        let indexPath =  IndexPath(row: positoin, section: 0)
        websitesCollectionView.scrollToItem(at: indexPath, at: .right , animated: true)
    }
    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        websitesTab.selectITemAtPosition(position: indexPath.row)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let screenWidth = view.frame.width
        let position: Int =  Int(targetContentOffset.pointee.x / screenWidth)
        
        print(position)
        websitesTab.selectITemAtPosition(position: position)
    }
    
    func websitesReceived(data: Any?, error: NSError?) {
         contentLoading.isHidden = true
        if error != nil {
            print("error \(error!)")
        }
        guard let data = data else{
            print("error data is null")
            return
        }
        do{
            try websites = JSONDecoder().decode([WebsiteModel].self, from: data as! Data )
            setupWebsitesNames()
        }catch let jsonError {
            print(jsonError)
        }
    }
    
    func setupWebsitesNames(){
        var websitesNames: [String] = []
        for websiteModel in websites {
            websitesNames.append(websiteModel.title)
        }
        websitesTab.categoriesNames = websitesNames
        websitesCollectionView.reloadData()
    }
    
    
    
}
