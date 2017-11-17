//
//  ArticelItemCell.swift
//  Best Articles
//
//  Created by Ziad Gholmish on 11/14/17.
//  Copyright © 2017 Ziad Gholmish. All rights reserved.
//

import UIKit

class ArticelItemCell: UITableViewCell{
    
    @IBOutlet weak var viewsCountlbl: UILabel!
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var articleTitlelbl: UILabel!
    @IBOutlet weak var articleDesclbl: UILabel!
    @IBOutlet weak var websiteLogo: UIImageView!
    @IBOutlet weak var websiteName: UILabel!
    
    func setUpData(article: ArticleModel){
        viewsCountlbl.text = "\(article.impressionist_count) View"
        articleTitlelbl.text = article.title
        articleDesclbl.text  = article.content
        websiteName.text = "By \(article.website.title)"
    }
    
}
