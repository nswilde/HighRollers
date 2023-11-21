//
//  Dice.swift
//  HighRollers
//
//  Created by Nikki Wilde on 22/11/23.
//

import Foundation

struct Dice: Identifiable {
    var sides: Int
    let id = UUID()
}

class DiceData {
    //storage load/save later
}

class Results {
    var result: [Dice]
    
    init(result: [Dice]) {
        self.result = result
    }
}


