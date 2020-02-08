//
//  MatchTableViewCell.swift
//  BeFoot
//
//  Created by Lukas Brasseleur on 24/01/2020.
//  Copyright © 2020 LukasYaniAless. All rights reserved.
//

import UIKit

class MatchTableViewCell: UITableViewCell {

    
    @IBOutlet var awayTeamLogo: UIImageView!
    @IBOutlet var awayTeamScore: UILabel!
    @IBOutlet var awayTeamName: UILabel!
    
    @IBOutlet var homeTeamLogo: UIImageView!
    @IBOutlet var homeTeamScore: UILabel!
    @IBOutlet var homeTeamName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
