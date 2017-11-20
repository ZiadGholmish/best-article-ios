//
//  ArticleDetailsVC.swift
//  Best Articles
//
//  Created by Ziad Gholmish on 11/19/17.
//  Copyright © 2017 Ziad Gholmish. All rights reserved.
//

import Foundation
import UIKit
class ArticleDetailsVC: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    @IBOutlet weak var navigationBar: UINavigationBar!
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
        webView.delegate = self
        loadingView.isHidden = false
        navigationBar.topItem?.title = selectedArticle.title
        let url = URL (string: selectedArticle.source_url)
        let request = URLRequest(url: url!)
        webView.loadRequest(request)
        
    }
    
    @IBAction func closeScreen(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func shareArticle(_ sender: Any) {
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        loadingView.isHidden = true
    }
    
    
}
