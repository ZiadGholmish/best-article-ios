//
//  TabCell.swift
//  Best Articles
//
//  Created by Ziad Gholmish on 11/18/17.
//  Copyright © 2017 Ziad Gholmish. All rights reserved.
//

import Foundation
import UIKit

class TabCell: UICollectionViewCell {
    
    let catName: UILabel = {
        let ul = UILabel()
        ul.translatesAutoresizingMaskIntoConstraints = false
        ul.text = "PlaceHolder"
        ul.textAlignment = .center
        ul.textColor = UIColor.blue
        return ul
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCellViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCellViews() {
        addSubview(catName)
        let views = ["v0" : catName]
        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics:nil, views: views)
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat:
            "V:|[v0(50)]|", options: [], metrics:nil, views: views)
        addConstraints(horizontalConstraints)
        addConstraints(verticalConstraints)
    }
    
    override var isHighlighted: Bool{
        didSet{
          
            if isHighlighted {
                catName.textColor =  UIColor.white
                catName.font =  catName.font.withSize(20)
            }else{
                catName.textColor =   UIColor.blue
                catName.font =  catName.font.withSize(15)
            }
        }
    }
    
    override var isSelected: Bool{
        didSet{
            if isSelected {
                catName.textColor =  UIColor.white
                catName.font =  catName.font.withSize(20)
            }else{
                catName.textColor =   UIColor.blue
                 catName.font =  catName.font.withSize(15)
            }
        }
    }
    
    func setCellData(name: String)  {  catName.text = name  }
    
}
