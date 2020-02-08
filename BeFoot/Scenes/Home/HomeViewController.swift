//
//  HomeViewController.swift
//  BeFoot
//
//  Created by Lukas Brasseleur on 10/01/2020.
//  Copyright © 2020 LukasYaniAless. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
      
    
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var matchTableView: UITableView!
    public static let MatchTableViewCellId = "mtvc"
    
    var matchList: [Match] = []
    
    var matchService: MatchService {
        return MatchServiceApi()
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        
        self.matchTableView.dataSource = self
        self.matchTableView.delegate = self
        self.matchTableView.register(UINib(nibName: "MatchTableViewCell", bundle: nil), forCellReuseIdentifier: HomeViewController.MatchTableViewCellId)
        
        
        getMatches(date: datePicker.date)
        
    }
    
    func getMatches(date: Date){
        
        self.matchService.getByDate(date: "2020-02-08", leagueId: 525) { matches in
            self.matchList = matches.fixtures
            DispatchQueue.main.async {
                self.matchTableView.reloadData()
            }
        }
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.matchList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeViewController.MatchTableViewCellId, for: indexPath) as! MatchTableViewCell
        
        if matchList.count > 0 {
            let match = self.matchList[indexPath.row]
            print(match)
            cell.homeTeamName.text = match.homeTeamName
            //cell.homeTeamLogo.image = UIImage(
            cell.awayTeamName.text = match.awayTeamName
            //cell.awayTeamLogo.image = UIImage(cgImage: CGImage)

            
            if let homeScore = match.homeTeamScore {
                cell.homeTeamScore.text = String(homeScore)
            } else {
                cell.homeTeamScore.text = "-"
            }
            
            if let awayScore = match.homeTeamScore {
                cell.awayTeamScore.text = String(awayScore)
            } else {
                cell.awayTeamScore.text = "-"
            }
        }
        
        return cell     
        
    }
}

extension HomeViewController: UITableViewDelegate {
    
}
