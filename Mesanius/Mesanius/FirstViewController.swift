//
//  FirstViewController.swift
//  Mesanius
//
//  Created by Hannes Waller on 2014-09-29.
//  Copyright (c) 2014 Hannes Waller. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlPath = "http://localhost:8080/rest/menu/"
        let url = NSURL(string: urlPath)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url, completionHandler: {data, response, error -> Void in
            
            if (error != nil) {
                println(error)
            } else {
                let jsonResult: AnyObject? = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil)
                println(jsonResult)
                
                if let dict = jsonResult as? NSArray {
                    for food : AnyObject in dict {
                        if let foodInfo = food as? Dictionary<String, AnyObject> {
                            let id : AnyObject = foodInfo["id"]!
                            let name : AnyObject = foodInfo["name"]!
                            //let description : AnyObject? = foodInfo["description"]
                            let price : AnyObject = foodInfo["price"]!
                            
                            println("ID: \(id)")
                            println("Name: \(name)")
                            //println("Description: \(description)")
                            println("Price: \(price)")
                            println("")
                        }
                    }
                    
                    
                    
                }
                
            }
        })
        
        task.resume()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

