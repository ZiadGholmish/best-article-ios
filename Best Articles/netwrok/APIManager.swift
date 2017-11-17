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


protocol APIManagerDelegate {
    func dataReceived(data: Any?, error: NSError?)
}

class APIManager: NSObject{
    
    var delegate: APIManagerDelegate?
    
    func getArticlesData() {
        
        let requestURL: String = APIConstants.BASE_URL + APIConstants.ARTICLES_URL_PREFIX
        
        Alamofire.request(requestURL).responseData{ (response) in
            switch response.result {
            case .success:
                guard let json = response.result.value else{
                    return
                }
                self.delegate?.dataReceived(data: json, error: nil)
                case .failure(let error):
                self.delegate?.dataReceived(data: nil, error: error as NSError)
            }
        }
    }
}
