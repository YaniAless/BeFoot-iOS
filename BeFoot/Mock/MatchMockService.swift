//
//  MatchmockService.swift
//  BeFoot
//
//  Created by Lukas Brasseleur on 24/01/2020.
//  Copyright © 2020 ESGI. All rights reserved.
//

import Foundation
import CoreLocation

class MatchMockService: MatchService {
    
    private let matchList: [Match] = [
        Match(id: "1", nameFirst: "Marseille", nameSecond: "PSG", scoreFirst: 4, scoreSecond: 1 ),
        Match(id: "2", nameFirst: "Rennes", nameSecond: "Bayern Munchen", scoreFirst: 10, scoreSecond: 2 ),
        Match(id: "3", nameFirst: "Paris FC", nameSecond: "Real Madrid", scoreFirst: 5, scoreSecond: 0 )
    ]
    
    func getAll(completion: @escaping ([Match]) -> Void) {
        completion(self.matchList)
    }
    
    func getByDate(_ date: Date, completion: @escaping (Match?) -> Void) {
        self.matchList[0]
    }
}
