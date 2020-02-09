//
//  HomeViewController.swift
//  BeFoot
//
//  Created by Lukas Brasseleur on 10/01/2020.
//  Copyright © 2020 LukasYaniAless. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
        
    @IBOutlet var leaguePicker: UIPickerView!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var matchTableView: UITableView!
    
    public static let MatchTableViewCellId = "mtvc"
    
    var matchList: [Match] = []
    private let leagues: [String] = ["Bundesliga","LIGA","Ligue 1","Premier League","Serie A"]
    private let leagueList: Dictionary<String, Int> = ["Bundesliga": 754,
                                                       "LIGA": 775,
                                                       "Ligue 1": 525,
                                                       "Premier League": 524,
                                                       "Serie A": 891]
    
    var matchService: MatchService {
        return MatchServiceApi()
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        
        self.matchTableView.dataSource = self
        self.matchTableView.delegate = self
        self.matchTableView.rowHeight = 100
        self.matchTableView.register(UINib(nibName: "MatchTableViewCell", bundle: nil), forCellReuseIdentifier: HomeViewController.MatchTableViewCellId)
        
        getMatches(league: leagues[0])
        
        self.leaguePicker.delegate = self
        self.leaguePicker.dataSource = self
        
    }
    
    func getDate(date: Date) -> String{
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd"
        let date = df.string(from: datePicker.date)
        
        return date
    }
    
    func getMatches(league: String){
        guard let leagueId = leagueList[league] else { return }
        self.matchService.getByDate(date: getDate(date: datePicker.date), leagueId: leagueId) { matches in
            self.matchList = matches.fixtures
            DispatchQueue.main.async {
                self.matchTableView.reloadData()
            }
        }
    }
    
    @IBAction func datePickerChanged(_ sender: Any) {
        getMatches(league: leagues[leaguePicker.selectedRow(inComponent: 0)])
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
            print(match.fixtureId)
            cell.matchId = match.fixtureId
            cell.homeTeamName.text = match.homeTeamName
            //cell.homeTeamLogo.image = UIImage(
            cell.awayTeamName.text = match.awayTeamName
            //cell.awayTeamLogo.image = UIImage(cgImage: CGImage)

            
            if let homeScore = match.homeTeamScore {
                cell.homeTeamScore.text = String(homeScore)
            } else {
                cell.homeTeamScore.text = "-"
            }
            
            if let awayScore = match.awayTeamScore {
                cell.awayTeamScore.text = String(awayScore)
            } else {
                cell.awayTeamScore.text = "-"
            }
        }
        return cell
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        getMatches(league: leagues[row])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
        let matchDetailsView = MatchDetailsViewController()
        self.present(matchDetailsView, animated: true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return leagues[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return leagueList.count
    }   
}
