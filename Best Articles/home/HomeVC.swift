//
//  FirstViewController.swift
//  Best Articles
//
//  Created by Ziad Gholmish on 11/14/17.
//  Copyright © 2017 Ziad Gholmish. All rights reserved.
//

import UIKit

class HomeVC : UIViewController, UITableViewDelegate,UITableViewDataSource , APIManagerArticlesDelegate {
  
    @IBOutlet weak var contentLoading: UIActivityIndicatorView!
    
    @IBOutlet weak var articlesTableView: UITableView!
    
    var articles: [ArticleModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    contentLoading.isHidden = false
        articlesTableView.delegate = self
        articlesTableView.dataSource = self
        
        let apiManager = APIManager.init()
        apiManager.articlesDelegate = self
        apiManager.getArticlesData()
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedArticle = articles[indexPath.row]
        performSegue(withIdentifier: "ArticleDetailsVC", sender: selectedArticle)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ArticleDetailsVC" {
            if let viewController = segue.destination as? ArticleDetailsVC {
                viewController.selectedArticle = sender as! ArticleModel
            }
        }
    }
    
    func articlesReceived(data: Any?, error: NSError?) {
        
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

