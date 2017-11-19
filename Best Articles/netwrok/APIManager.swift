//
//  NetwrokManager.swift
//  Best Articles
//
//  Created by Carriage Company on 11/16/17.
//  Copyright © 2017 Ziad Gholmish. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift


protocol APIManagerArticlesDelegate{
    func articlesReceived(data: Any?, error: NSError?)
}

protocol APIManagerCategoriesDelegate{
    func categoriesReceived(data: Any?, error: NSError?)
}
class APIManager: NSObject{
    
    var articlesDelegate: APIManagerArticlesDelegate?
     var categoriesDelegate: APIManagerCategoriesDelegate?
    
    func getArticlesData() {
        
        let requestURL: String = APIConstants.BASE_URL + APIConstants.ARTICLES_URL_PREFIX
          Alamofire.request(requestURL).responseData{ (response) in
            switch response.result {
            case .success:
                guard let json = response.result.value else{
                    return
                }
                self.articlesDelegate?.articlesReceived(data: json, error: nil)
                case .failure(let error):
                self.articlesDelegate?.articlesReceived(data: nil, error: error as NSError)
            }
        }
    }
    
    func getCategories(){
        let requestURL: String = APIConstants.BASE_URL + APIConstants.CATEGORIES_URL_PREFIX
        Alamofire.request(requestURL).responseData{ (response) in
            switch response.result {
            case .success:
                guard let json = response.result.value else{
                    return
                }
                self.categoriesDelegate?.categoriesReceived(data: json, error: nil)
            case .failure(let error):
                self.categoriesDelegate?.categoriesReceived(data: nil, error: error as NSError)
            }
        }
    }
    
    
}
