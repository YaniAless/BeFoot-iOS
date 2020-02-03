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
    
    var league: String = ""
    
    var teamList: [Team] = [] {
        didSet {
            self.teamTableView.reloadData()
        }
    }
    var teamService: TeamService {
        return TeamMockService()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "List"
        
        // self.matchTableView.rowHeight = 50
        self.teamTableView.dataSource = self
        self.teamTableView.delegate = self
        self.teamTableView.register(UINib(nibName: "TeamTableViewCell", bundle: nil), forCellReuseIdentifier: TeamTableViewController.teamTableViewCellId)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.teamService.getAll { (teamList) in
            self.teamList = teamList
        }
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
        return self.teamList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TeamTableViewController.teamTableViewCellId, for: indexPath) as! TeamTableViewCell
        let team = self.teamList[indexPath.row]
        cell.teamPointsLabel.text = String(team.teamPoints)
        cell.teamNameLabel.text = team.teamName
        cell.teamRankLabel.text = String(team.teamRank)
        return cell
    }
}

extension TeamTableViewController: UITableViewDelegate {
    
}
