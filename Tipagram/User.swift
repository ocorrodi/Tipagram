//
//  User.swift
//  Tipagram
//
//  Created by Olivia Corrodi on 8/31/18.
//  Copyright © 2018 Olivia Corrodi. All rights reserved.
//

import Foundation
import Foundation
import FirebaseDatabase.FIRDataSnapshot

class User {
    let uid: String
    
    init(uid: String) {
        self.uid = uid
        
    }
    
    init?(snapshot: DataSnapshot) {
        
        guard let dict = snapshot.value as? [String : Any],
            let uid = dict["uid"] as? String
            else { return nil }
        
        self.uid = snapshot.key
    }
}
