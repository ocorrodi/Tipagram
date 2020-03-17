//
//  Card.swift
//  Tipagram
//
//  Created by Olivia Corrodi on 8/31/18.
//  Copyright © 2018 Olivia Corrodi. All rights reserved.
//

import Foundation

class Card {
    
    let id: String
    let to: Waiter
    let from: Customer
    let amount: Double
    
    init(id: String, to: Waiter, from: Customer, amount: Double) {
        self.id = id
        self.from = from
        self.amount = amount
        self.to = to
        
    }
}
