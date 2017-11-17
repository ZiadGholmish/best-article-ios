//
//  FirstViewController.swift
//  Best Articles
//
//  Created by Ziad Gholmish on 11/14/17.
//  Copyright © 2017 Ziad Gholmish. All rights reserved.
//

import UIKit

class HomeVC : UIViewController, UITableViewDelegate,UITableViewDataSource {
   
    @IBOutlet weak var articlesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        articlesTableView.delegate = self
        articlesTableView.dataSource = self
    
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
       
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ArticelItemCell", for: indexPath) as? ArticelItemCell {
            return cell
        } else {
            return ArticelItemCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 375
    }
    
    
    

}

