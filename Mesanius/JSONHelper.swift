//
//  JSONHelper.swift
//  Mesanius
//
//  Created by Henrik Holmsen on 29.09.14.
//  Copyright (c) 2014 Hannes Waller. All rights reserved.
//

import Foundation

class JSONHelper{
    
     func fetchMenu(completionHandler: (callback: [Dish]) -> ()) {
    
        var menuList = [Dish]()
        
        let urlPath = "http://localhost:8080/rest/menu/"
        let url = NSURL(string: urlPath)
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithURL(url, completionHandler: {data, response, error -> Void in
            
            if (error != nil) {
                completionHandler(callback: menuList)
                println(error)
            } else {
                
                let jsonResult: AnyObject? = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil)
                //println(jsonResult)
                
                if let dict = jsonResult as? NSArray {
                    
                    for food : AnyObject in dict {
                        
                        if let foodInfo = food as? Dictionary<String, AnyObject> {
                            
                            if let id = foodInfo["id"] as AnyObject? as Int?{
                                if let name = foodInfo["name"] as AnyObject? as String?{
                                    if let price = foodInfo["price"] as AnyObject? as Int? {
                                        menuList.append(Dish(id: id, name: name, price: price))
                                    }
                                }
                            }
                        }
                    }
                }
                // Send callback with menuList
                completionHandler(callback: menuList)
            }
            
        })
        
        task.resume()
        
    }
    
    func getDescription(){
    
    
    }
}