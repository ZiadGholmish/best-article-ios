//
//  MostViewedVC.swift
//  Best Articles
//
//  Created by Carriage Company on 11/19/17.
//  Copyright © 2017 Ziad Gholmish. All rights reserved.
//

import Foundation
import UIKit

class MostViewedVC: UIViewController , UITableViewDataSource , UITableViewDelegate , APIManagerMostViewedDelegate{
    
    @IBOutlet weak var articlesTableView: UITableView!
    
    var articles: [ArticleModel] = []
    
    @IBOutlet weak var contentLoading: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        contentLoading.isHidden = false
        articlesTableView.delegate = self
        articlesTableView.dataSource = self
        
        let apiManager = APIManager.init()
        apiManager.mostViewedDelagate = self
        apiManager.getMostViewed()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ArticelItemCell", for: indexPath) as? ArticelItemCell {
            let article = articles[indexPath.row]
            cell.setUpData(article: article)
            return cell
        } else {
            return ArticelItemCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 375
    }
    
    func mostViewwedReceived(data: Any?, error: NSError?) {
         contentLoading.isHidden = true
        if error != nil {
            print("error \(error!)")
        }
        guard let data = data else{
            print("error data is null")
            return
        }
        do{
            try articles = JSONDecoder().decode([ArticleModel].self, from: data as! Data )
            articlesTableView.reloadData()
            
        }catch let jsonError {
            print(jsonError)
        }
        
    }
    
}
