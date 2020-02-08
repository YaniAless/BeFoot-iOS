//
//  PlayerServiceApi.swift
//  BeFoot
//
//  Created by lexinor on 08/02/2020.
//  Copyright © 2020 LukasYaniAless. All rights reserved.
//

import Foundation

class PlayerServiceApi: PlayerService {
    
    private let LOCAL_HOST: String = "http://localhost:3000/"
    private let REMOTE_HOST: String = "https://befoot.herokuapp.com/"
    
    func getAll(completion: @escaping ([Player]) -> Void) {
        completion([])
    }
    
    func getBestScorersByLeagueId(leagueId: Int, completion: @escaping (Players) -> Void) {
        let jsonUrlString = "\(LOCAL_HOST)topscorers/\(leagueId)"
        
        guard let url = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            guard let data = data else { return }
            do {
                let scorers = try JSONDecoder().decode(Players.self, from: data)
                completion(scorers)
            } catch let jsonErr {
                debugPrint("Error gettings scorers ! \(jsonErr)")
            }
        }.resume()
    }
}

struct Players: Decodable {
    let players: [Player]
}
