//
//  ScorerTableViewCell.swift
//  BeFoot
//
//  Created by lexinor on 31/01/2020.
//  Copyright © 2020 LukasYaniAless. All rights reserved.
//

import UIKit

class ScorerTableViewCell: UITableViewCell {

    
    @IBOutlet var playerName: UILabel!
    @IBOutlet var playerScore: UILabel!
    @IBOutlet var playerRank: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
