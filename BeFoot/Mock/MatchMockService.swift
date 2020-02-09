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
    func getMatchOdds(fixtureId: Int, completion: @escaping (Odds) -> Void) {
        completion(Odds(odd: [Odd(homeOdd: "", drawOdd: "", awayOdd: "")]))
    }
    
    func getMatchPrediction(fixtureId: Int, completion: @escaping (Predictions) -> Void) {
        completion(Predictions(prediction: [Prediction(homeForme: "", awayForme: "")]))
    }
    
    
    func getByDate(date: String, leagueId: Int, completion: @escaping (Matches) -> Void) {
        self.matchList[0]
    }
    
    
    private let matchList: [Match] = [
        Match(fixtureId: 1, matchDate: "2020-02-08", homeTeamName: "Marseille", homeTeamLogo: "", homeTeamScore: 0, awayTeamName: "Rennes", awayTeamLogo: "", awayTeamScore: 0),
        Match(fixtureId: 1, matchDate: "2020-02-08", homeTeamName: "Marseille2", homeTeamLogo: "", homeTeamScore: 0, awayTeamName: "Rennes2", awayTeamLogo: "", awayTeamScore: 0),
        Match(fixtureId: 1, matchDate: "2020-02-08", homeTeamName: "Marseille3", homeTeamLogo: "", homeTeamScore: 0, awayTeamName: "Rennes3", awayTeamLogo: "", awayTeamScore: 0),
        Match(fixtureId: 1, matchDate: "2020-02-08", homeTeamName: "Marseille4", homeTeamLogo: "", homeTeamScore: 0, awayTeamName: "Rennes4", awayTeamLogo: "", awayTeamScore: 0)
    ]
    
    func getAll(completion: @escaping ([Match]) -> Void) {
        completion(self.matchList)
    }
    
}
