//
//  Champion.swift
//  LeagueOfLegends-Skinship
//
//  Created by ドロケ on 25/08/2022.
//

import Foundation

struct Champion: Identifiable, Codable {
    var id: String
    var name: String
    var title: String
    var defaultSkin: String
    var skins: [Skin]
}

struct Skin: Identifiable, Codable {
    var id: Int
    var name: String
    var loading: String
}

