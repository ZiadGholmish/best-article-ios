//
//  ArticleModel.swift
//  Best Articles
//
//  Created by Ziad Gholmish on 11/15/17.
//  Copyright © 2017 Ziad Gholmish. All rights reserved.
//

import Foundation

class ArticleModel :Decodable{
    
      var content : String = ""
      var id : Int
      var title : String = ""
      var source_url : String = ""
      var image : String = ""
      var website : WebsiteModel;
      var created_at :String = ""
      var categories: [CategoryModel] = []
      var impressionist_count :Int = 0
    
    init( content: String  , id : Int ,    title : String , source_url : String ,    image : String ,   website : WebsiteModel , created_at :String ,categories: [CategoryModel] , impressionist_count :Int ) {
        self.content = content
        self.id = id
        self.title = title
        self.source_url = source_url
        self.image = image
        self.website = website
        self.created_at = created_at
        self.categories = categories
        self.impressionist_count = impressionist_count
    }
    
//    var content : String {
//        get{  return _content  }
//        set{ _content  = newValue }
//    }
//
//    var id : String {
//        get{  return _id  }
//        set{ _id  = newValue }
//    }
//
//    var title : String {
//        get{  return _title  }
//        set{ _title  = newValue }
//    }
//
//    var sourceUrl : String {
//        get{  return _source_url  }
//        set{ _source_url  = newValue }
//    }
//
//    var image : String {
//        get{  return _image  }
//        set{ _image  = newValue }
//    }
//
//    var website : WebsiteModel {
//        get{  return _website  }
//        set{ _website  = newValue }
//    }
//
//    var createdAt : String {
//        get{  return _created_at  }
//        set{ _created_at  = newValue }
//    }
//
//    var categories : [CategoryModel] {
//        get{  return _categories  }
//        set{ _categories  = newValue }
//    }
//
//    var ImpressionistCount : Int{
//        get{  return _impressionist_count  }
//        set{ _impressionist_count  = newValue }
//    }
}
