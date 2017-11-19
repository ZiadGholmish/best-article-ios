//
//  ArticleDetailsVC.swift
//  Best Articles
//
//  Created by Ziad Gholmish on 11/19/17.
//  Copyright © 2017 Ziad Gholmish. All rights reserved.
//

import Foundation
import UIKit
class ArticleDetailsVC: UIViewController {
    
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var artcileTitle: UILabel!
    @IBOutlet weak var btnShare: UIButton!
    @IBOutlet weak var webView: UIWebView!
    private var _selectedArticle: ArticleModel!
    var selectedArticle: ArticleModel{
        set{
            _selectedArticle = newValue
        }  get{
            return _selectedArticle
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    artcileTitle.text = selectedArticle.title
        let url = URL (string: selectedArticle.source_url)
        let request = URLRequest(url: url!)
        webView.loadRequest(request)
        
    }
    @IBAction func goBack(_ sender: Any) {
    self.dismiss(animated: true, completion: nil)
    }
    
}
