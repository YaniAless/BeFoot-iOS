//
//  CoteTableViewCell.swift
//  BeFoot
//
//  Created by Lukas Brasseleur on 08/02/2020.
//  Copyright © 2020 LukasYaniAless. All rights reserved.
//

import UIKit

class CoteTableViewCell: UITableViewCell {

    @IBOutlet var coteTeam1: UILabel!
    @IBOutlet var company: UILabel!
    @IBOutlet var coteTeam2: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
