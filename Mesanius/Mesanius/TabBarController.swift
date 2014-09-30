//
//  TabBarController.swift
//  Mesanius
//
//  Created by Henrik Holmsen on 30.09.14.
//  Copyright (c) 2014 Hannes Waller. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    var menuList:[Dish] = [Dish]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        JSONHelper().fetchMenu { (callback) -> () in
            self.menuList = callback
            println("Found \(self.menuList.count) dishes in menu: ")
            for dish in self.menuList {
                println("dish id: \(dish.id) name: \(dish.name) price: \(dish.price)")
                
            }
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
