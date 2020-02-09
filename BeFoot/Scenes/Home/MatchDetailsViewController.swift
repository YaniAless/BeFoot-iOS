//
//  MatchDetailsViewController.swift
//  BeFoot
//
//  Created by Lukas Brasseleur on 08/02/2020.
//  Copyright © 2020 LukasYaniAless. All rights reserved.
//

import UIKit

class MatchDetailsViewController: UIViewController {
        
    @IBOutlet var teamName1: UILabel!
    @IBOutlet var teamName2: UILabel!
    @IBOutlet var teamScore1: UILabel!
    @IBOutlet var teamScore2: UILabel!
    @IBOutlet var energy1: UILabel!
    @IBOutlet var energy2: UILabel!
    @IBOutlet var homeOdd: UILabel!
    @IBOutlet var drawOdd: UILabel!
    @IBOutlet var awayOdd: UILabel!
    
    var matchId = 0
    let teamName1Text: String
    let teamName2Text: String
    let teamScore1Text: String
    let teamScore2Text: String
    
    var prediction: [Prediction] = []
    var odds: [Odd] = []
    
    var match: Match?
    
    var matchService: MatchService {
        return MatchServiceApi()
    }
    
    init(matchId: Int, teamName1: String, teamName2: String, teamScore1: String, teamScore2: String) {
        self.matchId = matchId
        self.teamName1Text = teamName1
        self.teamName2Text = teamName2
        self.teamScore1Text = teamScore1
        self.teamScore2Text = teamScore2
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.teamName1.text = self.teamName1Text
        self.teamName2.text = self.teamName2Text
        self.teamScore1.text = self.teamScore1Text
        self.teamScore2.text = self.teamScore2Text
        print(getMatch(matchId: self.matchId))
        
        // Do any additional setup after loading the view.
    }
    
    func getMatch(matchId: Int){
        self.matchService.getMatchOdds(fixtureId: matchId){ odds in
            self.odds = odds.odd
            
            DispatchQueue.main.async {
                self.homeOdd.text = self.odds[0].homeOdd
                self.drawOdd.text = self.odds[0].drawOdd
                self.awayOdd.text = self.odds[0].awayOdd
            }
        }
        
        self.matchService.getMatchPrediction(fixtureId: matchId){ predictions in
            self.prediction = predictions.prediction
            
            DispatchQueue.main.async {
                self.energy1.text = self.prediction[0].homeForme
                self.energy2.text = self.prediction[0].awayForme
            }
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
