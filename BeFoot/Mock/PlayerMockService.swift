//
//  PlayerMockService.swift
//  BeFoot
//
//  Created by Lukas Brasseleur on 03/02/2020.
//  Copyright © 2020 LukasYaniAless. All rights reserved.
//

import Foundation

class PlayerMockService: PlayerService {
    func getBestScorersByLeagueId(leagueId: Int, completion: @escaping (Players) -> Void) {
        let p = Players(players: playerList)
        completion(p)
    }
    
    
    private let playerList : [Player] = [
        Player(playerName: "Del Piero", goals: 100, assists: 999, nbGames: 10),
        Player(playerName: "Cristiano Ronaldo", goals: 2000, assists: 100, nbGames: 50),
        Player(playerName: "Ronaldo", goals: 100, assists: 999, nbGames: 10),
        Player(playerName: "Kaka", goals: 100, assists: 999, nbGames: 10)
    ]
    
    func getAll(completion: @escaping ([Player]) -> Void) {
        completion(self.playerList)
    }
    
    
    
}
