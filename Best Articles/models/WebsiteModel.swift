//
//  WebsiteModel.swift
//  Best Articles
//
//  Created by Ziad Gholmish on 11/15/17.
//  Copyright © 2017 Ziad Gholmish. All rights reserved.
//

import Foundation

class WebsiteModel{
    
    private var _id :String
    private var _title :String
    private var _desc :String
    private var _website :String
    private var _about :String
    private var _image :String
    private var _articles: [ArticleModel]
    
    init(id :String,title :String,  desc :String, website :String, about :String, image :String, articles: [ArticleModel]) {
        self._id = id
        self._title = title
        self._desc = desc
        self._website = website
        self._about = about
        self._image = image
        self._articles = articles
    }
    
    var id :String {
        get{ return _id }
        set{_id = newValue}
    }
    
    var title :String {
        get{ return _title }
        set{_title = newValue}
    }
    
    var desc :String {
        get{ return _desc }
        set{_desc = newValue}
    }
    
    var website :String {
        get{ return _website }
        set{_website = newValue}
    }
 
    var about :String {
        get{ return _about }
        set{_about = newValue}
    }
    
    var image :String {
        get{ return _image }
        set{_image = newValue}
    }
    
    var articles :[ArticleModel] {
        get{ return _articles }
        set{_articles = newValue}
    }

}
