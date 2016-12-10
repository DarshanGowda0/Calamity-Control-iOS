//
//  FirstScene.swift
//  Calamity Control
//
//  Created by Darshan Gowda on 11/12/16.
//  Copyright © 2016 Darshan Gowda. All rights reserved.
//

import UIKit
import FirebaseDatabase

class DonatersVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var ref: FIRDatabaseReference!
    
    
    var donaters = [DonaterData]()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = FIRDatabase.database().reference()
        fetchData()
        
        tableView.delegate = self
        tableView.dataSource = self

    }
    
    func fetchData(){
        ref.child("donations").observeSingleEvent(of: .value, with: {(snapshot) in
            
            if let result = snapshot.children.allObjects as? [FIRDataSnapshot] {
                for child in result {
                    var data = DonaterData.init(name: child.value["name"] as! String, type: child.value["item"] as! String, number: child.value["number"] as! String, location: child.value["place"] as! String)
                    donaters.append(data)
                    
                }
            } else {
                print("no results")
            }
            
        }){(error) in
            print(error.localizedDescription)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        if let cell = tableView.dequeueReusableCell(withIdentifier: "donaterCell", for: indexPath) as? CustomCell{
//            cell.configureCell(data : donaters[indexPath.row])
//            return cell
//        }
        return UITableViewCell()
    }
    
}
