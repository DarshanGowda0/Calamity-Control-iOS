//
//  ViewController.swift
//  Calamity Control
//
//  Created by Darshan Gowda on 10/12/16.
//  Copyright © 2016 Darshan Gowda. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    let busPhone = "9742934099"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func callMeTapped(_ sender: Any) {
        performSegue(withIdentifier: "viewDetails", sender: nil)
    }
    

}











//    private func callNumber(phoneNumber:String) {
//        if let phoneCallURL:NSURL = NSURL(string: "tel://\(phoneNumber)") {
//            let application:UIApplication = UIApplication.shared
//            if (application.canOpenURL(phoneCallURL as URL)) {
//                application.openURL(phoneCallURL as URL);
//            }
//        }
//    }
