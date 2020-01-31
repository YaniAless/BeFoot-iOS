//
//  LeagueService.swift
//  BeFoot
//
//  Created by lexinor on 31/01/2020.
//  Copyright © 2020 LukasYaniAless. All rights reserved.
//

import Foundation

protocol LeagueService {
    
    func getLeagueRanking(completion: @escaping ([Team]) -> Void)
    func getTeamById(_ id: Int, completion: @escaping (Team?) -> Void)
}
