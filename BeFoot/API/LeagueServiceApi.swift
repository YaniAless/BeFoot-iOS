//
//  LeagueServiceApi.swift
//  BeFoot
//
//  Created by lexinor on 06/02/2020.
//  Copyright © 2020 LukasYaniAless. All rights reserved.
//

import Foundation
import CoreLocation
import Alamofire

class LeagueServiceApi: LeagueService {  
    
    
    private let LOCAL_HOST: String = "http://localhost:3000/"
    private let REMOTE_HOST: String = "https://befoot.herokuapp.com/"
    private let leagueList: [League] = []
    /*private let leagueList: [League] = [League(leagueId: 525, leagueName: "Ligue 1"),
                                        League(leagueId: 524, leagueName: "Premier League"),
                                        League(leagueId: 775, leagueName: "Liga"),
                                        League(leagueId: 775, leagueName: "Bundesliga"),
                                        League(leagueId: 775, leagueName: "Serie A")]

    */
    private let leaguesInfos: Dictionary<Int, String> = [525: "Ligue 1",
                                                         524: "Premier League",
                                                         775:"Liga",
                                                         754: "Bundesliga",
                                                         891: "Serie A"]
    
    func getAllLeague(completion: @escaping ([League]) -> Void) {
        completion(self.leagueList)
    }
    
    func getLeagueById(_ id: Int, completion: @escaping (League?) -> Void) {
        self.leaguesInfos[id]
    }
    
    /*
    func getLeagueStanding(leagueId: Int) {
        guard let leagueName = leaguesInfos[leagueId] else { return }
        var teams: [Team] = []
        var league = League(leagueId: leagueId, leagueName: leagueName, teams: teams)
            /*
        AF.request("\(LOCAL_HOST)standing/\(leagueId)").validate().responseJSON { response in
            //guard let data = response.data else { return }
            
            //guard let teams2 = String(data: data, encoding: .utf8) else { return }
            
            //print(teams2)
            guard let jsonResponse = response.data as?[[String: Any]],
                    let nom = jsonResponse["teamName"] as? String
                 return
             }
            print(jsonResponse)
        }*/
        
    }
    */
    
    func getLeagueStanding(leagueId: Int, completion: @escaping (Ranking) -> Void) {
        let jsonUrlString = "\(LOCAL_HOST)standing/525"
        guard let url = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            guard let data = data else { return }
            
            do {
                let teams = try JSONDecoder().decode(Ranking.self, from: data)
                completion(teams)
                print(teams)
            } catch let jsonErr {
                print("Error getting standings", jsonErr)
            }
        }.resume()
    }

    
}

struct Ranking: Decodable {
    let teams: [Team]
}
