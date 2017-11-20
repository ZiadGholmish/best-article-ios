//
//  CategoriesCell.swift
//  Best Articles
//
//  Created by Ziad Gholmish on 11/18/17.
//  Copyright © 2017 Ziad Gholmish. All rights reserved.
//

import UIKit
import Foundation
class CategoriesCell: UICollectionViewCell , UITableViewDelegate,UITableViewDataSource  {
    
    @IBOutlet weak var articlesTableView: UITableView!
    private var _currentCategoryModel: CategoryModel?
    var articleItemSelected: ArticleItemSelectedDelegator?

    func setArticlesForPage(categoryModel: CategoryModel)  {
        articlesTableView.delegate = self
        articlesTableView.dataSource = self
        self._currentCategoryModel = categoryModel
        articlesTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ArticelItemCell", for: indexPath) as? ArticelItemCell {
            
            if let category = _currentCategoryModel {
                if let articles = category.articles {
                    let article =   articles[indexPath.row]
                    cell.setUpData(article: article)
                }
            }
            return cell
        } else {
            return ArticelItemCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let category = _currentCategoryModel {
            if let articles = category.articles {
                return articles.count
            }
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 375
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedArticle = _currentCategoryModel?.articles![indexPath.row]
        articleItemSelected?.itemSelected(articleItem: selectedArticle!)
    }
    
    
}
