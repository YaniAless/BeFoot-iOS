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
    
    var rankCounter: Int = 1
    
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
        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
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
        cell.teamRankLabel.text = String(self.rankCounter)
        self.rankCounter += 1
        return cell
    }
}

extension TeamTableViewController: UITableViewDelegate {
    
}
