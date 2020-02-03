//
//  TeamMockService.swift
//  BeFoot
//
//  Created by Lukas Brasseleur on 03/02/2020.
//  Copyright © 2020 LukasYaniAless. All rights reserved.
//

import Foundation

class TeamMockService: TeamService {
    
    private let teamList : [Team] = [
            Team(teamId: 0, teamName: "Paris-Saint-Germain", teamPoints: 60, teamRank: 1),
            Team(teamId: 1, teamName: "Olympique de Marseille", teamPoints: 50, teamRank: 2),
            Team(teamId: 2, teamName: "Olympique Lyonnais", teamPoints: 40, teamRank: 3),
            Team(teamId: 3, teamName: "AS Monaco", teamPoints: 30, teamRank: 4),
            Team(teamId: 4, teamName: "Saint-Etienne", teamPoints: 20, teamRank: 5)
    ]
    
    func getAll(completion: @escaping ([Team]) -> Void) {
        completion(self.teamList)
    }
}
