//
//  WebsiteModel.swift
//  Best Articles
//
//  Created by Ziad Gholmish on 11/15/17.
//  Copyright © 2017 Ziad Gholmish. All rights reserved.
//

import Foundation

class WebsiteModel :Decodable{
    
      var id :Int
      var title :String
      var desc :String
      var website :String
      var about :String
      var image :String
      var articles: [ArticleModel]?
    
    init(id :Int,title :String,  desc :String, website :String, about :String, image :String, articles: [ArticleModel]) {
        self.id = id
        self.title = title
        self.desc = desc
        self.website = website
        self.about = about
        self.image = image
        self.articles = articles
    }
    
//    var id :String {
//        get{ return _id }
//        set{_id = newValue}
//    }
//
//    var title :String {
//        get{ return _title }
//        set{_title = newValue}
//    }
//
//    var desc :String {
//        get{ return _desc }
//        set{_desc = newValue}
//    }
//
//    var website :String {
//        get{ return _website }
//        set{_website = newValue}
//    }
//
//    var about :String {
//        get{ return _about }
//        set{_about = newValue}
//    }
//
//    var image :String {
//        get{ return _image }
//        set{_image = newValue}
//    }
//
//    var articles :[ArticleModel] {
//        get{ return _articles }
//        set{_articles = newValue}
//    }

}
