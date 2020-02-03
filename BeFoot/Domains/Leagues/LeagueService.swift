//
//  LeagueService.swift
//  BeFoot
//
//  Created by lexinor on 31/01/2020.
//  Copyright © 2020 LukasYaniAless. All rights reserved.
//

import Foundation

protocol LeagueService {
    
    func getAllLeague(completion: @escaping ([League]) -> Void)
    func getLeagueById(_ id: Int, completion: @escaping (League?) -> Void)
}
