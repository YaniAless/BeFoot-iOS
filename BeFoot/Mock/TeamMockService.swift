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
        Team(teamRank: 1, teamName: "Paris", teamLogo: "LOGO", teamPoints: 99, teamGoalDiff: 99),
        Team(teamRank: 2, teamName: "Paris", teamLogo: "LOGO", teamPoints: 99, teamGoalDiff: 99),
        Team(teamRank: 3, teamName: "Paris", teamLogo: "LOGO", teamPoints: 99, teamGoalDiff: 99),
        Team(teamRank: 4, teamName: "Paris", teamLogo: "LOGO", teamPoints: 99, teamGoalDiff: 99),
        Team(teamRank: 5, teamName: "Paris", teamLogo: "LOGO", teamPoints: 99, teamGoalDiff: 99),
        Team(teamRank: 6, teamName: "Paris", teamLogo: "LOGO", teamPoints: 99, teamGoalDiff: 99)
    ]
    
    func getAll(completion: @escaping ([Team]) -> Void) {
        completion(self.teamList)
    }
}
