//
//  Waiter.swift
//  Tipagram
//
//  Created by Olivia Corrodi on 8/31/18.
//  Copyright © 2018 Olivia Corrodi. All rights reserved.
//

import Foundation

class Waiter {
    
    let name: String
    let photoURL: String
    let story: String
    let restaurants: [Restaurant]
    let cards: [Card]
    
    init(name: String, photoURL: String, story: String, restaurants: [Restaurant], cards: [Card]) {
        self.name = name
        self.photoURL = photoURL
        self.story = story
        self.restaurants = restaurants
        self.cards = cards
    }
    
}
