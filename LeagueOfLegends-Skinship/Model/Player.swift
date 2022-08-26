//
//  Player.swift
//  LeagueOfLegends-Skinship
//
//  Created by ドロケ on 27/08/2022.
//

import Foundation

class Player: Identifiable {
    var id = UUID().uuidString
    var name: String
    var score: Int
    var dateCreated = Date()
    
    init(name: String, score: Int) {
        self.name = name
        self.score = score
    }
}
