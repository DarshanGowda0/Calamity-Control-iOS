//
//  VolunteerCell.swift
//  Calamity Control
//
//  Created by Darshan Gowda on 11/12/16.
//  Copyright © 2016 Darshan Gowda. All rights reserved.
//

import UIKit

class VolunteerCell: UITableViewCell {

    @IBOutlet weak var thumb: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var placeLabel: UILabel!
    
    func configureCell(data : VolunteerData){
        nameLabel.text = data.name
        numberLabel.text = data.number
        placeLabel.text = data.location
    }
    
}
