//
//  TeamService.swift
//  BeFoot
//
//  Created by Lukas Brasseleur on 03/02/2020.
//  Copyright © 2020 LukasYaniAless. All rights reserved.
//

import Foundation

protocol TeamService {
    
    func getAll(completion: @escaping ([Team]) -> Void)
}
