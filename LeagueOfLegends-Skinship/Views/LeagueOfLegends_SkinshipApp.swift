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
    
    @State private var appState = "splash"
    @State private var gameMode = "normal"
    
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
