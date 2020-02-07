//
//  LeaguesViewController.swift
//  BeFoot
//
//  Created by lexinor on 31/01/2020.
//  Copyright © 2020 LukasYaniAless. All rights reserved.
//

import UIKit

class LeaguesViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet var leaguesPicker: UIPickerView!
    
    @IBOutlet var assistsButton: UIButton!
    @IBOutlet var scorersButton: UIButton!
    @IBOutlet var rankButton: UIButton!
    
    var leagues: [String] = []
    var leagueList: [League] = []
    var ranking: Ranking = Ranking(teams: [Team(teamRank: 1, teamName: "", teamLogo: "", teamPoints: 34, teamGoalDiff: 44)])

    
    var selectedLeague:Int = 0
    var leagueService: LeagueService {
        //return LeagueMockService()
        return LeagueServiceApi()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.leagueService.getAllLeague { (leagueList) in
            self.leagueList = leagueList
            self.leagues = leagueList.map { league in
                return league.leagueName
            }
        }
        
        self.leagueService.getLeagueStanding(leagueId: 525) { rank in
            self.ranking = rank
        }

        self.leaguesPicker.dataSource = self
        self.leaguesPicker.delegate = self
        
        self.title = "Leagues"
        
        // Do any additional setup after loading the view.

    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return leagues[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return leagues.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    @IBAction func rankTouchAction(_ sender: UIButton) {
        let leagueIndex = leaguesPicker.selectedRow(inComponent: 0)
        let teamTableViewController = TeamTableViewController(league: leagueList[leagueIndex])
            self.present(teamTableViewController, animated: true)
        
    }
    
    
    @IBAction func scorersTouchAction(_ sender: UIButton) {
        let leagueIndex = leaguesPicker.selectedRow(inComponent: 0)
        let scorerTableViewController = TeamTableViewController(league: leagueList[leagueIndex])
        self.present(scorerTableViewController, animated: true)
    }
    
    
    @IBAction func assistTouchAction(_ sender: UIButton) {
        let leagueIndex = leaguesPicker.selectedRow(inComponent: 0)
        let assistTableViewController = TeamTableViewController(league: leagueList[leagueIndex])
        self.present(assistTableViewController, animated: true)
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
