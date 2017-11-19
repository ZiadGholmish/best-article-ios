//
//  CategoryModel.swift
//  Best Articles
//
//  Created by Ziad Gholmish on 11/15/17.
//  Copyright © 2017 Ziad Gholmish. All rights reserved.
//

import Foundation

class CategoryModel :Decodable{
    
      var  id :Int
      var  title :String
      var  image :String
      var articles :[ArticleModel]?
    
    init(id :Int, title :String, image :String, articles :[ArticleModel]) {
        self.id = id
        self.title = title
        self.image = image
        self.articles = articles
    }
    
//    var id:String{
//        get{ return _id; }
//        set{ _id = newValue}
//    }
//    
//    var title:String{
//        get{ return _title; }
//        set{ _title = newValue}
//    }
//    
//    var image:String{
//        get{ return _image; }
//        set{ _image = newValue}
//    }
//    
//    var articles:[ArticleModel]{
//        get{ return _articles; }
//        set{ _articles = newValue}
//    }
}
