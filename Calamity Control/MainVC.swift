//
//  ViewController.swift
//  Calamity Control
//
//  Created by Darshan Gowda on 10/12/16.
//  Copyright © 2016 Darshan Gowda. All rights reserved.
//

import UIKit
import Alamofire

class MainVC: UIViewController {

    let busPhone = "9742934099"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func callMeTapped(_ sender: Any) {
        performSegue(withIdentifier: "viewDetails", sender: nil)
    }
    
    @IBAction func alertTapped(_ sender: Any) {
        
        let alert = UIAlertController(title: "Recorded", message: "Your Report is submitted", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }

}

