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
        
    }
    
    func getByDate(date: String, leagueId: Int,completion: @escaping (Matches) -> Void) {
        let jsonUrlString = "\(LOCAL_HOST)match/\(leagueId)/\(date)"
        
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
}

struct Matches: Decodable {
    let fixtures: [Match]
}
