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
    
    var league: String = ""
    
    var scorerList: [Player] = [] {
        didSet {
            self.scorerTableView.reloadData()
        }
    }
    var playerService: PlayerService {
        return PlayerMockService()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "List"
        
        // self.matchTableView.rowHeight = 50
        self.scorerTableView.dataSource = self
        self.scorerTableView.delegate = self
        self.scorerTableView.register(UINib(nibName: "ScorerTableViewCell", bundle: nil), forCellReuseIdentifier: ScorerTableViewController.scorerTableViewCellId)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.playerService.getAll { (scorerList) in
            self.scorerList = scorerList
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

extension ScorerTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.scorerList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ScorerTableViewController.scorerTableViewCellId, for: indexPath) as! ScorerTableViewCell
        let player = self.scorerList[indexPath.row]
        cell.playerName.text = player.playerName
        cell.playerScore.text = String(player.goalNumber)
        return cell
    }
}

extension ScorerTableViewController: UITableViewDelegate {
    
}
