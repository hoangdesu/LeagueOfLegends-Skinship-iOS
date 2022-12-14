//
//  LeagueOfLegends_SkinshipApp.swift
//  LeagueOfLegends-Skinship
//
//  Created by ドロケ on 25/08/2022.
//

/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2022B
 Assessment: Assignment 2
 Author: Hoang Nguyen
 ID: s3697305
 Last modified: 29/08/2022
 */

import SwiftUI

@main
struct LeagueOfLegends_SkinshipApp: App {
    
    @State private var appState = AppState.splash
    @State private var gameMode = "normal"
    
    var body: some Scene {
        WindowGroup {
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
