//
//  FirstViewController.swift
//  Mesanius
//
//  Created by Hannes Waller on 2014-09-29.
//  Copyright (c) 2014 Hannes Waller. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var acvityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var menuTableView: UITableView!
    var menuList:[Dish] = [Dish]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.acvityIndicator.startAnimating()
        self.acvityIndicator.hidesWhenStopped = true
        
        self.menuTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "MenuCell")
        self.menuTableView.dataSource = self
        
        JSONHelper().fetchMenu { (callback) -> () in
            self.menuList = callback
            self.menuTableView.reloadData()
            self.acvityIndicator.stopAnimating()
            println("Found \(self.menuList.count) dishes in menu: ")
            for dish in self.menuList {
                println("dish id: \(dish.id) name: \(dish.name) price: \(dish.price)")
            }
            
        }
    
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

