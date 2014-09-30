//
//  SecondViewController.swift
//  Mesanius
//
//  Created by Hannes Waller on 2014-09-29.
//  Copyright (c) 2014 Hannes Waller. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var menuTableView: UITableView!
    var menuList:[Dish] = [Dish]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.menuTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "MenuCell")
        self.menuTableView.dataSource = self
        
        var tBBControler: TabBarController = self.tabBarController as TabBarController
        self.menuList = tBBControler.menuList
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.menuList.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell(style: .Subtitle, reuseIdentifier: "MenuCell") as UITableViewCell
        
        cell.textLabel?.text = self.menuList[indexPath.row].name
        var subtitileText = String(self.menuList[indexPath.row].price) + " kr"
        cell.detailTextLabel?.text = subtitileText
        
        return cell
        
    }


}

