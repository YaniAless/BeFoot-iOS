//
//  HomeViewController.swift
//  BeFoot
//
//  Created by Lukas Brasseleur on 10/01/2020.
//  Copyright © 2020 LukasYaniAless. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    @IBOutlet var dayMatch: UIButton!
    @IBOutlet var pronostics: UIButton!
    @IBOutlet var history: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
    }
    
    
    @IBAction func touchDayMatch(_ sender: Any) {
        self.navigationController?.pushViewController(DayMatchViewController(), animated: true)
    }
    
    @IBAction func touchPronsotics(_ sender: Any) {
        self.navigationController?.pushViewController(PronosticsViewController(), animated: true)
    }
    
    @IBAction func touchHistory(_ sender: Any) {
        self.navigationController?.pushViewController(HistoryViewController(), animated: true)
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
