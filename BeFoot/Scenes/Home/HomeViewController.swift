//
//  HomeViewController.swift
//  BeFoot
//
//  Created by Lukas Brasseleur on 10/01/2020.
//  Copyright © 2020 LukasYaniAless. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    @IBOutlet var matchTableView: UITableView!
    public static let MatchTableViewCellId = "mtvc"
    
    var matchList: [Match] = [] {
        didSet {
            self.matchTableView.reloadData()
        }
    }
    var matchService: MatchService {
        return MatchMockService()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        
        // self.matchTableView.rowHeight = 50
        self.matchTableView.dataSource = self
        self.matchTableView.delegate = self
        self.matchTableView.register(UINib(nibName: "MatchTableViewCell", bundle: nil), forCellReuseIdentifier: HomeViewController.MatchTableViewCellId)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.matchService.getAll { (matchList) in
            self.matchList = matchList
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

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.matchList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeViewController.MatchTableViewCellId, for: indexPath) as! MatchTableViewCell
        let match = self.matchList[indexPath.row]
        cell.nameFirst.text = match.nameFirst
        cell.nameSecond.text = match.nameSecond
        cell.scoreFirst.text = String(match.scoreFirst)
        cell.scoreSecond.text = String(match.scoreSecond)
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    
}
