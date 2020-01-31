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
    
    var leagues = ["Bundesliga","Ligue 1","LIGA","Premier League"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
