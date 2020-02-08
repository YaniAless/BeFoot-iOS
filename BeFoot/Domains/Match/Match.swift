//
//  Match.swift
//  BeFoot
//
//  Created by Lukas Brasseleur on 24/01/2020.
//  Copyright © 2020 LukasYaniAless. All rights reserved.
//

import Foundation

struct Match: Decodable {
    let fixtureId: Int
    let matchDate: String
    let homeTeamName: String
    let homeTeamLogo: String
    let homeTeamScore: Int?
    let awayTeamName: String
    let awayTeamLogo: String
    let awayTeamScore: Int?
}
