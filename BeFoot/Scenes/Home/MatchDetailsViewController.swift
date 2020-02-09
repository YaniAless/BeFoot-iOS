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
    @IBOutlet var energy1: UILabel!
    @IBOutlet var energy2: UILabel!
    @IBOutlet var coteList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
