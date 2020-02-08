//
//  LeagueServiceApi.swift
//  BeFoot
//
//  Created by lexinor on 06/02/2020.
//  Copyright © 2020 LukasYaniAless. All rights reserved.
//

import Foundation
import CoreLocation

class LeagueServiceApi: LeagueService {
    
    private let LOCAL_HOST: String = "http://localhost:3000/"
    private let REMOTE_HOST: String = "https://befoot.herokuapp.com/"
    private var leagueList: [League] = []
    private let emptyTeam: [Team] = []
    private let leaguesInfos: Dictionary<Int, String> = [754: "Bundesliga",
                                                         775: "Liga",
                                                         525: "Ligue 1",
                                                         524: "Premier League",
                                                         891: "Serie A"]
    
    init() {
        for league in leaguesInfos {
            let l: League = League(leagueId: league.key, leagueName: league.value, teams: emptyTeam)
            leagueList.append(l)
        }
    }
    
    func getAllLeague(completion: @escaping ([League]) -> Void) {
        completion(self.leagueList)
    }
    
    func getLeagueById(_ id: Int, completion: @escaping (League?) -> Void) {
        self.leaguesInfos[id]
    }
    
    func getLeagueStanding(leagueId: Int, completion: @escaping (Ranking) -> Void) {
        let jsonUrlString = "\(REMOTE_HOST)standing/\(leagueId)"
        guard let url = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            guard let data = data else { return }
            do {
                let teams = try JSONDecoder().decode(Ranking.self, from: data)
                completion(teams)
                //print(teams)
            } catch let jsonErr {
                print("Error getting standings", jsonErr)
            }
        }.resume()
    }

}

struct Ranking: Decodable {
    let teams: [Team]
}
