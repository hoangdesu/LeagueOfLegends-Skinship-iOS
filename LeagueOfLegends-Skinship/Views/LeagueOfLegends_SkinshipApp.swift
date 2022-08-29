//
//  LeagueOfLegends_SkinshipApp.swift
//  LeagueOfLegends-Skinship
//
//  Created by ドロケ on 25/08/2022.
//

import SwiftUI

@main
struct LeagueOfLegends_SkinshipApp: App {
    
    //    enum AppState: String {
    //        case
    //    }
    
    @State private var appState = "splash"
    @State private var gameMode = "normal"
    
    
    //    init() {
    //        print(self.appState)
    //        print(self.appState == "slash")
    //    }
    
    var body: some Scene {
        WindowGroup {
            if self.appState == "splash" {
                SplashScreenView(appState: $appState)
            } else if self.appState == "home" {
                HomeView(appState: $appState, gameMode: $gameMode)
            } else if self.appState == "game" {
                GameView(appState: $appState, gameMode: $gameMode)
            } else if self.appState == "tutorial" {
                TutorialView(appState: $appState)
            }
        }
    }
}
