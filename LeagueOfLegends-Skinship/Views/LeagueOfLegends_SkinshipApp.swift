//
//  LeagueOfLegends_SkinshipApp.swift
//  LeagueOfLegends-Skinship
//
//  Created by ドロケ on 25/08/2022.
//

import SwiftUI

@main
struct LeagueOfLegends_SkinshipApp: App {
    private var champions = decodeJsonFromFile(jsonFileName: "champions.json")

    var body: some Scene {
        WindowGroup {
//            ContentView()
            GameView(firstChamp: champions.randomElement()!)
        }
    }
}
