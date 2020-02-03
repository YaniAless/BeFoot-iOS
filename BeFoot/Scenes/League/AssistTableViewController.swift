//
//  AssistTableViewController.swift
//  BeFoot
//
//  Created by Lukas Brasseleur on 03/02/2020.
//  Copyright © 2020 LukasYaniAless. All rights reserved.
//

import UIKit

class AssistTableViewController: UIViewController {
    
    @IBOutlet var assistTableView: UITableView!
    public static let assistTableViewCellId = "atvc"
    var league: String = ""
    
    
    var assistList: [Player] = [] {
        didSet {
            self.assistTableView.reloadData()
        }
    }
    var playerService: PlayerService {
        return PlayerMockService()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "List"
        
        // self.matchTableView.rowHeight = 50
        self.assistTableView.dataSource = self
        self.assistTableView.delegate = self
        self.assistTableView.register(UINib(nibName: "AssistTableViewCell", bundle: nil), forCellReuseIdentifier: AssistTableViewController.assistTableViewCellId)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.playerService.getAll { (assistList) in
            self.assistList = assistList
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

extension AssistTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.assistList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AssistTableViewController.assistTableViewCellId, for: indexPath) as! AssistTableViewCell
        let player = self.assistList[indexPath.row]
        cell.playerName.text = player.playerName
        cell.playerAssist.text = String(player.assistNumber)
        return cell
    }
}

extension AssistTableViewController: UITableViewDelegate {
    
}
