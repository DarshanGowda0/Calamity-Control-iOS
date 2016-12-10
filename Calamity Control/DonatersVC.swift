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
            
            if let snapshot = snapshot.children.allObjects as? [FIRDataSnapshot]{
                for snap in snapshot{
                    if let dict = snap.value as? Dictionary<String,AnyObject>{
                        let data = DonaterData(dict: dict)
                        self.donaters.append(data)
                    }
                }
            }
            self.tableView.reloadData()
        }){(error) in
            print(error.localizedDescription)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return donaters.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "donaterCell", for: indexPath) as? CustomCell{
            cell.configureCell(data : donaters[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
}
