//
//  VolunteersVC.swift
//  Calamity Control
//
//  Created by Darshan Gowda on 11/12/16.
//  Copyright © 2016 Darshan Gowda. All rights reserved.
//

import UIKit
import FirebaseDatabase

class VolunteersVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var ref : FIRDatabaseReference!
    var volunteers = [VolunteerData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        ref = FIRDatabase.database().reference()
        fetchData()

        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func fetchData(){
        ref.child("volunteers").observeSingleEvent(of: .value, with: {(snapshot) in
            
            if let snapshot = snapshot.children.allObjects as? [FIRDataSnapshot]{
                for snap in snapshot{
                    if let dict = snap.value as? Dictionary<String,AnyObject>{
                        let data = VolunteerData(dict: dict)
                        self.volunteers.append(data)
                    }
                }
            }
            self.tableView.reloadData()
        }){(error) in
            print(error.localizedDescription)
        }

    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return volunteers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "volunteerCell", for: indexPath) as? VolunteerCell{
            cell.configureCell(data : volunteers[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }

}
