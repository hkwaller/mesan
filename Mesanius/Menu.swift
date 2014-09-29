//
//  Menu.swift
//  Mesanius
//
//  Created by Henrik Holmsen on 29.09.14.
//  Copyright (c) 2014 Hannes Waller. All rights reserved.
//

import Foundation

class Menu {
    
    func getMenuList() -> [Dish]{
        
        var menuList = [Dish]()
        
        var menuFromJSON:NSArray = JSONHelper().getMenu()
        
        println("number of items in menuFromJSON: \(menuFromJSON.count)")
        
        for food : AnyObject in menuFromJSON {
            
            if let foodInfo = food as? Dictionary<String, AnyObject> {
                
                let id = foodInfo["id"]! as Int
                let name = foodInfo["name"]! as String
                let price = foodInfo["price"]! as Int
                
                menuList.append(Dish(id: id, name: name, price: price))
                
                println("ID: \(id)")
                println("Name: \(name)")
                //println("Description: \(description)")
                println("Price: \(price)")
                println("")
            }
        }
    
        
    return menuList
    }
    
}