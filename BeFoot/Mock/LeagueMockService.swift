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
    func getLeagueBestScorers(leagueId: Int, completion: @escaping (Players) -> Void) {
        
    }
    
    func getLeagueStanding(leagueId: Int, completion: @escaping (Ranking) -> Void) {
        let team: Team = Team(teamRank: 99, teamName: "ttt", teamLogo: "ttt", teamPoints: 12, teamGoalDiff: 123)
        let r: Ranking = Ranking(teams: [team])
        completion(r)
    }
    
    
    private let leagueList : [League] = [
        League(leagueId: 1, leagueName: "Ligue 1", teams: [
            Team(teamRank: 1, teamName: "Paris", teamLogo: "LOGO", teamPoints: 99, teamGoalDiff: 99),
            Team(teamRank: 2, teamName: "Paris", teamLogo: "LOGO", teamPoints: 99, teamGoalDiff: 99),
            Team(teamRank: 3, teamName: "Paris", teamLogo: "LOGO", teamPoints: 99, teamGoalDiff: 99),
            Team(teamRank: 4, teamName: "Paris", teamLogo: "LOGO", teamPoints: 99, teamGoalDiff: 99),
            Team(teamRank: 5, teamName: "Paris", teamLogo: "LOGO", teamPoints: 99, teamGoalDiff: 99),
            Team(teamRank: 6, teamName: "Paris", teamLogo: "LOGO", teamPoints: 99, teamGoalDiff: 99)
        ]
            ),
        League(leagueId: 2, leagueName: "Bundesliga", teams: [
            Team(teamRank: 1, teamName: "Paris", teamLogo: "LOGO", teamPoints: 99, teamGoalDiff: 99),
            Team(teamRank: 2, teamName: "Paris", teamLogo: "LOGO", teamPoints: 99, teamGoalDiff: 99),
            Team(teamRank: 3, teamName: "Paris", teamLogo: "LOGO", teamPoints: 99, teamGoalDiff: 99),
            Team(teamRank: 4, teamName: "Paris", teamLogo: "LOGO", teamPoints: 99, teamGoalDiff: 99),
            Team(teamRank: 5, teamName: "Paris", teamLogo: "LOGO", teamPoints: 99, teamGoalDiff: 99),
            Team(teamRank: 6, teamName: "Paris", teamLogo: "LOGO", teamPoints: 99, teamGoalDiff: 99)
        ]
            ),
        League(leagueId: 3, leagueName: "Premier League", teams: [
            Team(teamRank: 1, teamName: "Paris", teamLogo: "LOGO", teamPoints: 99, teamGoalDiff: 99),
            Team(teamRank: 2, teamName: "Paris", teamLogo: "LOGO", teamPoints: 99, teamGoalDiff: 99),
            Team(teamRank: 3, teamName: "Paris", teamLogo: "LOGO", teamPoints: 99, teamGoalDiff: 99),
            Team(teamRank: 4, teamName: "Paris", teamLogo: "LOGO", teamPoints: 99, teamGoalDiff: 99),
            Team(teamRank: 5, teamName: "Paris", teamLogo: "LOGO", teamPoints: 99, teamGoalDiff: 99),
            Team(teamRank: 6, teamName: "Paris", teamLogo: "LOGO", teamPoints: 99, teamGoalDiff: 99)
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
