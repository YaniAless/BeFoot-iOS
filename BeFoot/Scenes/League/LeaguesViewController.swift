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

    
    var selectedLeague:String = ""
    var leagueService: LeagueService {
        return LeagueMockService()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.leagueService.getAllLeague { (leagueList) in
            self.leagues = leagueList.map { league in
                return league.leagueName
            }
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
    
    private func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        self.selectedLeague = leagues[row]
     }
    
    
    @IBAction func rankTouchAction(_ sender: UIButton) {
        let teamTableViewController = TeamTableViewController()
        teamTableViewController.league = self.selectedLeague
        self.present(teamTableViewController, animated: true)
    }
    
    
    @IBAction func scorersTouchAction(_ sender: UIButton) {
        let scorerTableViewController = ScorerTableViewController()
        scorerTableViewController.league = self.selectedLeague
        self.present(scorerTableViewController, animated: true)
    }
    
    
    @IBAction func assistTouchAction(_ sender: UIButton) {
        let assistTableViewController = AssistTableViewController()
        assistTableViewController.league = self.selectedLeague
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
