//
//  MatchDetailsViewController.swift
//  BeFoot
//
//  Created by Lukas Brasseleur on 08/02/2020.
//  Copyright © 2020 LukasYaniAless. All rights reserved.
//

import UIKit

class MatchDetailsViewController: UIViewController {
    
    @IBOutlet var leagueName: UILabel!
    
    @IBOutlet var teamName1: UILabel!
    @IBOutlet var teamName2: UILabel!
    @IBOutlet var teamScore1: UILabel!
    @IBOutlet var teamScore2: UILabel!
    @IBOutlet var energy1: UILabel!
    @IBOutlet var energy2: UILabel!
    @IBOutlet var coteList: UITableView!
    
    var matchId = 0
    
    var match: Match?
    
    var matchService: MatchService {
        return MatchServiceApi()
    }
    
    init(matchId: Int) {
        self.matchId = matchId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(getMatch(matchId: self.matchId))
        
        // Do any additional setup after loading the view.
    }
    
    func getMatch(matchId: Int){
        self.matchService.getMatchOdds(fixtureId: matchId){ odds in
            print(odds)
//            DispatchQueue.main.async {
//                self.matchTableView.reloadData()
//            }
        }
        
        self.matchService.getMatchPrediction(fixtureId: matchId){ predictions in
            print(predictions)
//            DispatchQueue.main.async {
//                self.matchTableView.reloadData()
//            }
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
