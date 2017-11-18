//
//  SecondViewController.swift
//  Best Articles
//
//  Created by Ziad Gholmish on 11/14/17.
//  Copyright © 2017 Ziad Gholmish. All rights reserved.
//

import UIKit

class CategoriesVC: UIViewController , APIManagerCategoriesDelegate{
    
    var categories: [CategoryModel]  = []
    
    let categoriesTab: TabLayout = {
        let cTab = TabLayout()
        cTab.translatesAutoresizingMaskIntoConstraints = false
        return cTab
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabLayout()
      
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
    
    func articlesReceived(data: Any?, error: NSError?) {
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
    }
}

