//
//  Team.swift
//  BeFoot
//
//  Created by lexinor on 31/01/2020.
//  Copyright © 2020 LukasYaniAless. All rights reserved.
//

import Foundation

struct Team: Decodable {
    var teamRank: Int
    var teamName: String
    var teamLogo: String
    var teamPoints: Int
    var teamGoalDiff: Int
}
