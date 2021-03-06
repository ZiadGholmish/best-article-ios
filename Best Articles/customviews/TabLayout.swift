//
//  TabLayout.swift
//  Best Articles
//
//  Created by Ziad Gholmish on 11/17/17.
//  Copyright © 2017 Ziad Gholmish. All rights reserved.
//

import Foundation
import UIKit

protocol TabSelectedDelegate{
    func itemSelected(positoin: Int)
}

class TabLayout: UIView, UICollectionViewDataSource , UICollectionViewDelegate , UICollectionViewDelegateFlowLayout {
    
    var tabSeelctedDelegate: TabSelectedDelegate?
    private var _categoriesNames: [String] = []
    var horizontalBarLeftAnchorConstraint: NSLayoutConstraint?
    var categoriesNames: [String] {
        get{
            return _categoriesNames
        }
        set{
            _categoriesNames = newValue
            collectionView.reloadData()
        }
    }
    
    let cellId = "CategoryCell"
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero , collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        layout.scrollDirection = .horizontal
        cv.collectionViewLayout = layout
        cv.backgroundColor = UIColor(red:  CGFloat(64/255.0), green:  CGFloat(97/255.0), blue:   CGFloat(196/255.0), alpha: 1)
        cv.allowsMultipleSelection = false
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        collectionView.register(TabCell.self, forCellWithReuseIdentifier: cellId)
        addSubview(collectionView)
        let views = ["v0":collectionView]
        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: views)
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(50)]|", options: [], metrics: nil, views: views)
        addConstraints(verticalConstraints)
        addConstraints(horizontalConstraints)
    }
    
    func setupSrollBarForTabs() {
        
        let horizonalBar = UIView()
        horizonalBar.backgroundColor = UIColor.white
        horizonalBar.translatesAutoresizingMaskIntoConstraints = false
        addSubview(horizonalBar)
        
        //set the constrains
        horizontalBarLeftAnchorConstraint =  horizonalBar.leftAnchor.constraint(equalTo: self.leftAnchor)
        horizontalBarLeftAnchorConstraint?.isActive = true
        
        horizonalBar.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0.5).isActive = true
        horizonalBar.widthAnchor.constraint(equalToConstant: 120).isActive = true
        horizonalBar.heightAnchor.constraint(equalToConstant: 4).isActive = true

    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return _categoriesNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! TabCell
        cell.setCellData(name: _categoriesNames[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120 , height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        tabSeelctedDelegate?.itemSelected(positoin: indexPath.row)
    }
    
    func selectITemAtPosition(position: Int)  {
        let indexPath = IndexPath(item: position, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .right, animated: true)
        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .right)
    }
    
}
