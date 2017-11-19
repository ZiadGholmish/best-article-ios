//
//  SecondViewController.swift
//  Best Articles
//
//  Created by Ziad Gholmish on 11/14/17.
//  Copyright © 2017 Ziad Gholmish. All rights reserved.
//

import UIKit

class CategoriesVC: UIViewController , APIManagerCategoriesDelegate , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout , TabSelectedDelegate {
    
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
   
    @IBOutlet weak var contentLoading: UIActivityIndicatorView!
    
    var categories: [CategoryModel]  = []
    let cellId = "CategoriesCell"
    
    lazy var categoriesTab: TabLayout = {
        let cTab = TabLayout()
        cTab.translatesAutoresizingMaskIntoConstraints = false
        cTab.tabSeelctedDelegate = self
        return cTab
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentLoading.isHidden = false
        setupTabLayout()
        categoriesCollectionView.dataSource = self
        categoriesCollectionView.delegate = self
        let apiManager = APIManager.init()
        apiManager.categoriesDelegate = self
        apiManager.getCategories()
    }
    
    func setupTabLayout() {
        view.addSubview(categoriesTab)
        let views = ["v0" : categoriesTab]
        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics:nil, views: views)
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat:
            "V:|-30-[v0(50)]|", options: [], metrics:nil, views: views)
        view.addConstraints(horizontalConstraints)
        view.addConstraints(verticalConstraints)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId ,
                                                         for: indexPath) as? CategoriesCell {
            let categoryModel = categories[indexPath.row]
            cell.setArticlesForPage(categoryModel: categoryModel)
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
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let screenWidth = view.frame.width
        let position: Int =  Int(targetContentOffset.pointee.x / screenWidth)
        categoriesTab.selectITemAtPosition(position: position)
    }
    
    func itemSelected(positoin: Int) {
       let indexPath =  IndexPath(row: positoin, section: 0)
        categoriesCollectionView.scrollToItem(at: indexPath, at: .right , animated: true)
    }
    
    func categoriesReceived(data: Any?, error: NSError?) {
         contentLoading.isHidden = true
        if error != nil {
            print("error \(error!)")
        }
        guard let data = data else{
            print("error data is null")
            return
        }
        do{
            try categories = JSONDecoder().decode([CategoryModel].self, from: data as! Data )
            setupCategoriesNames()
        }catch let jsonError {
            print(jsonError)
        }
    }
    
    func setupCategoriesNames() {
        var catNames: [String] = []
        for categoryModel in categories {
            catNames.append(categoryModel.title)
        }
        categoriesTab.categoriesNames = catNames
        categoriesCollectionView.reloadData()
    }
}

