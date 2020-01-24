//
//  MatchService.swift
//  BeFoot
//
//  Created by Lukas Brasseleur on 24/01/2020.
//  Copyright © 2020 LukasYaniAless. All rights reserved.
//

import Foundation
protocol MatchService {
    
    func getAll(completion: @escaping ([Match]) -> Void)
    func getByDate(_ date: Date, completion: @escaping (Match?) -> Void)
}
