//
//  LeagueOfLegends_SkinshipApp.swift
//  LeagueOfLegends-Skinship
//
//  Created by ドロケ on 25/08/2022.
//

import SwiftUI



@main
struct LeagueOfLegends_SkinshipApp: App {
    
    
    @State private var appState = AppState.splash
    @State private var gameMode = "normal"
    
    var body: some Scene {
        WindowGroup {
//            if self.appState == "splash" {
//                SplashScreenView(appState: $appState)
//            } else if self.appState == "home" {
//                HomeView(appState: $appState, gameMode: $gameMode)
//            } else if self.appState == "game" {
//                GameView(appState: $appState, gameMode: $gameMode)
//            } else if self.appState == "tutorial" {
//                TutorialView(appState: $appState)
//            }
            
            switch (self.appState) {
            case .splash:
                SplashScreenView(appState: $appState)
            case .home:
                HomeView(appState: $appState, gameMode: $gameMode)
            case .game:
                GameView(appState: $appState, gameMode: $gameMode)
            case .tutorial:
                TutorialView(appState: $appState)
            }
            
            
        }
    }
}

enum AppState {
    case splash, home, game, tutorial
}
