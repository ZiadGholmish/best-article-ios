//
//  CategoryModel.swift
//  Best Articles
//
//  Created by Ziad Gholmish on 11/15/17.
//  Copyright © 2017 Ziad Gholmish. All rights reserved.
//

import Foundation

class CategoryModel{
    
    private var  _id :String
    private var  _title :String
    private var  _image :String
    private var _articles :[ArticleModel]
    
    init(id :String, title :String, image :String, articles :[ArticleModel]) {
        self._id = id
        self._title = title
        self._image = image
        self._articles = articles
    }
    
    var id:String{
        get{ return _id; }
        set{ _id = newValue}
    }
    
    var title:String{
        get{ return _title; }
        set{ _title = newValue}
    }
    
    var image:String{
        get{ return _image; }
        set{ _image = newValue}
    }
    
    var articles:[ArticleModel]{
        get{ return _articles; }
        set{ _articles = newValue}
    }
}
