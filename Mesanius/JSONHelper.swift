//
//  JSONHelper.swift
//  Mesanius
//
//  Created by Henrik Holmsen on 29.09.14.
//  Copyright (c) 2014 Hannes Waller. All rights reserved.
//

import Foundation

class JSONHelper{
    
    func getMenu() -> NSArray {
    
        var menuItems = NSArray()

        let urlPath = "http://localhost:8080/rest/menu/"
        let url = NSURL(string: urlPath)
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithURL(url, completionHandler: {data, response, error -> Void in
            
            if (error != nil) {
                println(error)
            } else {
                
                let jsonResult: AnyObject? = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil)
                
                if let dict = jsonResult as? NSArray {
                    
                println(dict)
                menuItems = dict as NSArray
                   
                }
                
            }
        })
        
        task.resume()
        
        println(menuItems)
        return menuItems
        
    }
    
    func getDescription(){
    
    
    }
}