//
//  File.swift
//  Calamity Control
//
//  Created by Darshan Gowda on 11/12/16.
//  Copyright © 2016 Darshan Gowda. All rights reserved.
//

import Foundation
import UIKit

class Report{
    private var _calamity:String!
    private var _lat:Double!
    private var _lon:Double!
    
    
    var calamity :String{
        if _calamity == nil{
            _calamity = "NA"
        }
        return _calamity
    }
    
    var lat:Double{
        if _lat == nil{
            _lat = 0
        }
        return _lat
    }
    
    var lon:Double{
        if _lon == nil{
            _lon = 0
        }
        return _lon
    }
    
    init(dict : Dictionary<String,AnyObject>) {
        
        if let calamity = dict["calamity"] as? String{
            _calamity = calamity
        }
        
        if let lat = dict["lat"] as? Double{
            _lat = lat
        }
        
        if let lon = dict["lng"] as? Double{
            _lon = lon
        }
        
    }
}
