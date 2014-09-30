//
//  Menu.swift
//  Mesanius
//
//  Created by Henrik Holmsen on 29.09.14.
//  Copyright (c) 2014 Hannes Waller. All rights reserved.
//

import Foundation

class Menu {
    
    private var menuList = [Dish]()
    
    init(){
        
        JSONHelper().fetchMenu { (callback) -> () in
            
            self.menuList = callback
            println("Found \(self.menuList.count) dishes in menu: ")
            for dish in self.menuList {
                println("dish id: \(dish.id) name: \(dish.name) price: \(dish.price)")
            }
        }
    }
    
    func getMenuList() -> [Dish]{
        
        return self.menuList
    }
    
    
}