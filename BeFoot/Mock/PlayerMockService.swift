//
//  PlayerMockService.swift
//  BeFoot
//
//  Created by Lukas Brasseleur on 03/02/2020.
//  Copyright © 2020 LukasYaniAless. All rights reserved.
//

import Foundation

class PlayerMockService: PlayerService {
    
    private let playerList : [Player] = [
        Player(playerId: 1, playerName: "Zidane", goalNumber: 86, assistNumber: 43),
        Player(playerId: 2, playerName: "Ronaldino", goalNumber: 113, assistNumber: 52),
        Player(playerId: 3, playerName: "CR7", goalNumber: 38, assistNumber: 12),
        Player(playerId: 4, playerName: "Kaka", goalNumber: 72, assistNumber: 34)
    ]
    
    func getAll(completion: @escaping ([Player]) -> Void) {
        completion(self.playerList)
    }
    
    
    
}
