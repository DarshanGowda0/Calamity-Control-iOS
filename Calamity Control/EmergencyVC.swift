//
//  SecondScene.swift
//  Calamity Control
//
//  Created by Darshan Gowda on 11/12/16.
//  Copyright © 2016 Darshan Gowda. All rights reserved.
//

import UIKit
import GoogleMaps

class EmergencyVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var data = [EmergencyData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchData()
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    func fetchData() {
        
        var temp = EmergencyData(name: "Amruth Pillai", number: "9845336113");
        data.append(temp)
        temp = EmergencyData(name: "Rohan Kumar", number: "8792414258")
        data.append(temp)
        
        temp = EmergencyData(name: "Darshan N", number: "9742934099")
        data.append(temp)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "emergencyCell", for: indexPath) as? EmergencyCell{
            cell.configureCell(data: data[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
}
