//
//  ArticleModel.swift
//  Best Articles
//
//  Created by Ziad Gholmish on 11/15/17.
//  Copyright © 2017 Ziad Gholmish. All rights reserved.
//

import Foundation

class ArticleModel{
    
    private var _content : String = ""
    private var _id : String = ""
    private var _title : String = ""
    private var _source_url : String = ""
    private var _image : String = ""
    private var _website : WebsiteModel;
    private var _created_at :String = ""
    private var _categories: [CategoryModel] = []
    private var _impressionist_count :Int = 0
    
    init( content: String  ,    id : String ,    title : String , source_url : String ,    image : String ,   website : WebsiteModel , created_at :String ,categories: [CategoryModel] , impressionist_count :Int ) {
        self._content = content
        self._id = id
        self._title = title
        self._source_url = source_url
        self._image = image
        self._website = website
        self._created_at = created_at
        self._categories = categories
        self._impressionist_count = impressionist_count
    }
    
    var content : String {
        get{  return _content  }
        set{ _content  = newValue }
    }
    
    var id : String {
        get{  return _id  }
        set{ _id  = newValue }
    }
    
    var title : String {
        get{  return _title  }
        set{ _title  = newValue }
    }
    
    var sourceUrl : String {
        get{  return _source_url  }
        set{ _source_url  = newValue }
    }
    
    var image : String {
        get{  return _image  }
        set{ _image  = newValue }
    }
    
    var website : WebsiteModel {
        get{  return _website  }
        set{ _website  = newValue }
    }
    
    var createdAt : String {
        get{  return _created_at  }
        set{ _created_at  = newValue }
    }
    
    var categories : [CategoryModel] {
        get{  return _categories  }
        set{ _categories  = newValue }
    }

    var ImpressionistCount : Int{
        get{  return _impressionist_count  }
        set{ _impressionist_count  = newValue }
    }
}
