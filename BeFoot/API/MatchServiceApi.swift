//
//  MatchServiceApi.swift
//  BeFoot
//
//  Created by lexinor on 08/02/2020.
//  Copyright © 2020 LukasYaniAless. All rights reserved.
//

import Foundation

class MatchServiceApi: MatchService {
    
    private let LOCAL_HOST: String = "http://localhost:3000/"
    private let REMOTE_HOST: String = "https://befoot.herokuapp.com/"
    
    func getAll(completion: @escaping ([Match]) -> Void) {
        completion([])
    }
    
    func getByDate(date: String, leagueId: Int,completion: @escaping (Matches) -> Void) {
        let jsonUrlString = "\(REMOTE_HOST)match/\(leagueId)/\(date)"
        
        guard let url = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            guard let data = data else { return }
            do {
                let matches = try JSONDecoder().decode(Matches.self, from: data)
                completion(matches)
            } catch let jsonErr {
                debugPrint("Error gettings Matches ! \(jsonErr)")
            }
        }.resume()
    }
    
    func getMatchOdds(fixtureId: Int, completion: @escaping (Odds) -> Void) {
        let jsonUrlString = "\(REMOTE_HOST)odds/\(fixtureId)"
        
        guard let url = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            guard let data = data else { return }
            do {
                let odds = try JSONDecoder().decode(Odds.self, from: data)
                print(odds)
                //completion(odds)
            } catch let jsonErr {
                debugPrint("Error gettings match odds ! \(jsonErr)")
            }
        }.resume()
    }
    
    func getMatchPrediction(fixtureId: Int, completion: @escaping (Predictions) -> Void) {
        let jsonUrlString = "\(REMOTE_HOST)predictions/\(fixtureId)/"
        
        guard let url = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            guard let data = data else { return }
            do {
                let predictions = try JSONDecoder().decode(Predictions.self, from: data)
                print(predictions)
                //completion(predictions)
            } catch let jsonErr {
                debugPrint("Error gettings match predictions ! \(jsonErr)")
            }
        }.resume()
    }
}

struct Matches: Decodable {
    let fixtures: [Match]
}

struct Odds: Decodable {
    let odd: [Odd]
}

struct Odd: Decodable {
    let homeOdd, drawOdd, awayOdd: String
}

struct Predictions: Decodable {
    let prediction: [Prediction]
}

struct Prediction: Decodable {
    let homeForme, awayForme: String
}
