//
//  ScorerTableViewController.swift
//  BeFoot
//
//  Created by Lukas Brasseleur on 03/02/2020.
//  Copyright © 2020 LukasYaniAless. All rights reserved.
//

import UIKit

class ScorerTableViewController: UIViewController {
    
    @IBOutlet var scorerTableView: UITableView!
    public static let scorerTableViewCellId = "stvc"
    
    var leagueId: Int = 0
 
    var scorerList: [Player] = []
    
    /*
    var playerService: PlayerService {
        return PlayerMockService()
    } */
    
    var playerServiceAPI: PlayerService {
        return PlayerServiceApi()
    }
    
    init(leagueId: Int) {
        self.leagueId = leagueId
        //self.scorerList.teams = self.league.teams.sorted(by: { $0.teamPoints > $1.teamPoints })
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "List"
        
        // self.matchTableView.rowHeight = 50
        self.scorerTableView.dataSource = self
        self.scorerTableView.delegate = self
        self.scorerTableView.register(UINib(nibName: "ScorerTableViewCell", bundle: nil), forCellReuseIdentifier: ScorerTableViewController.scorerTableViewCellId)
        
        self.playerServiceAPI.getBestScorersByLeagueId(leagueId: self.leagueId) { scorers in
            
            self.scorerList = scorers.players
            
            DispatchQueue.main.async {
                self.scorerTableView.reloadData()
            }
            
        }
                
    }
    /*
    override func viewDidAppear(_ animated: Bool) {
        self.playerService.getAll { (scorerList) in
            self.scorerList = scorerList
        }
    }*/
    
}

extension ScorerTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.scorerList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ScorerTableViewController.scorerTableViewCellId, for: indexPath) as! ScorerTableViewCell
        let player = self.scorerList[indexPath.row]
        cell.playerName.text = player.playerName
        cell.playerScore.text = String(player.goals)
        cell.playerRank.text = String(indexPath.row + 1)
        return cell
    }
}

extension ScorerTableViewController: UITableViewDelegate {
    
}
