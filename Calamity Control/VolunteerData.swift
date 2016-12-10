//
//  VolunteerData.swift
//  Calamity Control
//
//  Created by Darshan Gowda on 11/12/16.
//  Copyright © 2016 Darshan Gowda. All rights reserved.
//

import Foundation
import UIKit

class VolunteerData{
    
    private var _name:String!
    private var _number:String!
    private var _location:String!
    
    var name:String{
        if _name == nil{
            _name = "NA"
        }
        return _name
    }
    
    var number:String{
        if _number == nil{
            _number = "NA"
        }
        return _number
    }
    
    var location:String{
        if _location == nil{
            _location = "NA"
        }
        return _location
    }
    
    init(dict : Dictionary<String,AnyObject>) {
        if let name = dict["name"] as? String{
            self._name = name
        }
        if let number = dict["number"] as? String{
            self._number = number
        }
        if let place = dict["place"] as? String{
            self._location = place
        }
    }
    
}