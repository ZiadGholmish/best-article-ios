//
//  WebsiteCell.swift
//  Best Articles
//
//  Created by Carriage Company on 11/19/17.
//  Copyright © 2017 Ziad Gholmish. All rights reserved.
//

import Foundation
import UIKit
class WebsiteCell: UICollectionViewCell , UITableViewDelegate,UITableViewDataSource  {
    
    @IBOutlet weak var articlesTableView: UITableView!
    private var _currentWebsiteModel: WebsiteModel?
    
    func setArticlesForPage(website: WebsiteModel)  {
        articlesTableView.delegate = self
        articlesTableView.dataSource = self
        self._currentWebsiteModel = website
        articlesTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ArticelItemCell", for: indexPath) as? ArticelItemCell {
            if let website = _currentWebsiteModel {
                if let articles = website.articles {
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
        if let website = _currentWebsiteModel {
            if let articles = website.articles {
                return articles.count
            }
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 375
    }
    
}

