//
//  EmergencyCell.swift
//  Calamity Control
//
//  Created by Darshan Gowda on 11/12/16.
//  Copyright © 2016 Darshan Gowda. All rights reserved.
//

import UIKit

class EmergencyCell: UITableViewCell {

    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var thumb: UIImageView!
    
    func configureCell(data : EmergencyData){
        nameLabel.text = data.name
        numberLabel.text = data.number
    }
}
