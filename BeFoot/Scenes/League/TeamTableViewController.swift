//
//  TeamTableViewController.swift
//  BeFoot
//
//  Created by Lukas Brasseleur on 03/02/2020.
//  Copyright © 2020 LukasYaniAless. All rights reserved.
//

import UIKit

class TeamTableViewController: UIViewController {
    
    @IBOutlet var teamTableView: UITableView!
    public static let teamTableViewCellId = "ttvc"
    
    var league: League
    
    var leagueService: LeagueService {
        return LeagueServiceApi()
    }
        
    init(league: League) {
        self.league = league
        self.league.teams = self.league.teams.sorted(by: { $0.teamPoints > $1.teamPoints })
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "List"
        
        // self.matchTableView.rowHeight = 50
        self.teamTableView.dataSource = self
        self.teamTableView.delegate = self
        self.teamTableView.register(UINib(nibName: "TeamTableViewCell", bundle: nil), forCellReuseIdentifier: TeamTableViewController.teamTableViewCellId)
        
        self.leagueService.getLeagueStanding(leagueId: self.league.leagueId) { rank in
            self.league.teams = rank.teams
            DispatchQueue.main.async {
                self.teamTableView.reloadData()
            }
        }        
    }
    
}

extension TeamTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.league.teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TeamTableViewController.teamTableViewCellId, for: indexPath) as! TeamTableViewCell
        
         let team = self.league.teams[indexPath.row]
        
        cell.teamPointsLabel.text = String(team.teamPoints)
        cell.teamNameLabel.text = team.teamName
        cell.teamRankLabel.text = String(team.teamRank)
        return cell
    }
}

extension TeamTableViewController: UITableViewDelegate {
    
}
