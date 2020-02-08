//
//  PlayerService.swift
//  BeFoot
//
//  Created by Lukas Brasseleur on 03/02/2020.
//  Copyright © 2020 LukasYaniAless. All rights reserved.
//

import Foundation

protocol PlayerService {
    
    func getAll(completion: @escaping ([Player]) -> Void)
    func getBestScorersByLeagueId(leagueId: Int, completion: @escaping (Players) -> Void)
}
