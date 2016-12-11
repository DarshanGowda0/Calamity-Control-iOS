//
//  EmergencyData.swift
//  Calamity Control
//
//  Created by Darshan Gowda on 11/12/16.
//  Copyright © 2016 Darshan Gowda. All rights reserved.
//

import Foundation
import UIKit

class EmergencyData{
    
    private var _name:String!
    private var _number:String!
    
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
    
    
    init(name : String,number:String) {
        
        self._name = name
        self._number = number
        
    }
    
}
