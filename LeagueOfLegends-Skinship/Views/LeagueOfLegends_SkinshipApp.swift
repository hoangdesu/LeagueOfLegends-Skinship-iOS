//
//  LeagueOfLegends_SkinshipApp.swift
//  LeagueOfLegends-Skinship
//
//  Created by ドロケ on 25/08/2022.
//

import SwiftUI

@main
struct LeagueOfLegends_SkinshipApp: App {

    @State var showingGame = false
    
    var body: some Scene {
        WindowGroup {
            if showingGame {
                GameView(showingGame: $showingGame)
            } else {
                HomeView(showingGame: $showingGame)
            }
        
        }
    }
}
