//
//  Restaurant.swift
//  Tipagram
//
//  Created by Olivia Corrodi on 8/31/18.
//  Copyright © 2018 Olivia Corrodi. All rights reserved.
//

import Foundation

class Restaurant {
    
    let address: String
    let name: String
    let employees: [Waiter]
    
    init(address: String, name: String, employees: [Waiter]) {
        self.address = address
        self.name = name
        self.employees = employees
    }
}
