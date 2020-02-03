//
//  MatchmockService.swift
//  BeFoot
//
//  Created by Lukas Brasseleur on 24/01/2020.
//  Copyright © 2020 ESGI. All rights reserved.
//

import Foundation
import CoreLocation

class LeagueMockService: LeagueService {
    
    private let leagueList : [League] = [
        League(leagueId: 1, leagueName: "Ligue 1", teams: [
            Team(teamId: 0, teamName: "Paris-Saint-Germain", teamPoints: 60, teamRank: 1),
            Team(teamId: 1, teamName: "Olympique de Marseille", teamPoints: 50, teamRank: 2),
            Team(teamId: 2, teamName: "Olympique Lyonnais", teamPoints: 40, teamRank: 3),
            Team(teamId: 3, teamName: "AS Monaco", teamPoints: 30, teamRank: 4),
            Team(teamId: 4, teamName: "Saint-Etienne", teamPoints: 20, teamRank: 5)
        ]
            ),
        League(leagueId: 2, leagueName: "Bundesliga", teams: [
            Team(teamId: 0, teamName: "Paris-Saint-Germain", teamPoints: 60, teamRank: 1),
            Team(teamId: 1, teamName: "Olympique de Marseille", teamPoints: 50, teamRank: 2),
            Team(teamId: 2, teamName: "Olympique Lyonnais", teamPoints: 40, teamRank: 3),
            Team(teamId: 3, teamName: "AS Monaco", teamPoints: 30, teamRank: 4),
            Team(teamId: 4, teamName: "Saint-Etienne", teamPoints: 20, teamRank: 5)
        ]
            ),
        League(leagueId: 3, leagueName: "Premier League", teams: [
            Team(teamId: 0, teamName: "Paris-Saint-Germain", teamPoints: 60, teamRank: 1),
            Team(teamId: 1, teamName: "Olympique de Marseille", teamPoints: 50, teamRank: 2),
            Team(teamId: 2, teamName: "Olympique Lyonnais", teamPoints: 40, teamRank: 3),
            Team(teamId: 3, teamName: "AS Monaco", teamPoints: 30, teamRank: 4),
            Team(teamId: 4, teamName: "Saint-Etienne", teamPoints: 20, teamRank: 5)
        ]
            ),
    ]
    
    func getAllLeague(completion: @escaping ([League]) -> Void) {
        completion(self.leagueList)
    }
    
    func getLeagueById(_ id: Int, completion: @escaping (League?) -> Void) {
        self.leagueList[id]
    }
    
    
    
}
