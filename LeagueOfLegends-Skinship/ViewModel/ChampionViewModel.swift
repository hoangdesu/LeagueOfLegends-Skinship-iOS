//
//  ChampionViewModel.swift
//  LeagueOfLegends-Skinship
//
//  Created by ドロケ on 26/08/2022.
//

/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2022B
 Assessment: Assignment 2
 Author: Hoang Nguyen
 ID: s3697305
 Last modified: 29/08/2022
 Acknowledgement: https://github.com/zydeico/SlotMachine
 */

import Foundation
import SwiftUI

class ChampionViewModel: ObservableObject {
    
    // MARK: - STATES
    let haptics = UINotificationFeedbackGenerator()
    
    @Published var currentChamp: Champion = champions[0]
    @Published var nextChamp = champions[1]
    
    @Published var currentChampSkin = ""
    @Published var nextChampSkin = ""
    
    @Published var choices: [Champion] = []
    
    @Published var score: Int = 0
    @AppStorage("highScore") var highscore: Int = 0
    @AppStorage("topPlayer") var topPlayer = "Doroke"
    @Published var hasNewTopPlayer = false
    @Published var playNewHighScoreOnce = false
    
    // music states
    @Published var backgroundMusic = "SR - Early Game"
    @Published var backgroundMusicVolume: Double = 0.69
    
    // animation states
    @Published var isAnimating = false
    @Published var rotationDirection = 1.0 // 1.0: left to right, -1.0: right to left
    
    // modal states
    @Published var showRankedModeResultModal = false
    @Published var animatingRankedStopModal = false
    @Published var correctAnswer = ""
    
    init() {
        self.resetGameState()
    }
    
    // MARK: - Heart of the program
    func gamePlayController(choice: Champion, gameMode: String) {
        
        // correct choice
        if currentChamp.id == choice.id {
            if self.score % 5 == 0 {
                playAnnouncerSound(sound: winAnnoucers.randomElement()!, type: "mp3", volume: 0.7)
            }
            
            // update new highscore
            if self.score > self.highscore {
                self.highscore = self.score
                self.hasNewTopPlayer = true
            }
            
            if !self.playNewHighScoreOnce && self.hasNewTopPlayer {
                playSound2Effect(sound: "newhighscore", type: "wav", volume: 0.7)
                self.playNewHighScoreOnce = true
            }
            
            self.rotationDirection = 1.0
            haptics.notificationOccurred(.success)
            
            playSoundEffect(sound: goldSounds.randomElement()!, type: "wav", volume: 0.3)
            
        // incorrect choice
        } else {
            self.score -= 1
            self.rotationDirection = -1.0
            haptics.notificationOccurred(.error)
            
            // stop the game in ranked mode
            if gameMode == "ranked" {
                self.showRankedModeResultModal = true
            }
            
            playSoundEffect(sound: loseSounds.randomElement()!, type: "wav", volume: 0.3)
        }
        
        self.isAnimating = true
    }
    
    func generateCurrentChamp() {
        self.currentChamp = champions.randomElement()!
    }
    
    
    func generate4RandomChoices() {
        self.choices = [self.currentChamp]
        for _ in 0..<3 {
            self.choices.append(champions.randomElement()!)
        }
        
        while self.hasDuplicatedChoices() {
            self.choices = [self.currentChamp]
            for _ in 0..<3 {
                self.choices.append(champions.randomElement()!)
            }
        }
        
        self.choices = self.choices.shuffled()
    }
    
    func resetGameState() {
        self.isAnimating = true
        
        self.generateCurrentChamp()
        self.generateCurrentChampSkin()
        
        self.generateNextChamp()
        self.generateNextChampSkin()
        
        self.generate4RandomChoices()
        
        self.score = 0
        self.hasNewTopPlayer = false
    }
    
    func getRandomSkinFromCurrentChamp() -> String {
        let i = Int.random(in: 0..<self.currentChamp.skins.count)
        return self.currentChamp.skins[i].loading
    }
    
    func generateNextChamp() {
        self.nextChamp = champions.randomElement()!
        
        while self.nextChamp.id == self.currentChamp.id {
            self.nextChamp = champions.randomElement()!
        }
    }
    
    func hasDuplicatedChoices() -> Bool {
        var seen = [String: String]()
        
        for i in 0..<self.choices.count {
            let keyExists = seen[self.choices[i].id] != nil
            if keyExists {
                return true
            } else {
                let id = self.choices[i].id
                seen[id] = id
            }
        }
        return false
    }
    
    func generateCurrentChampSkin() {
        self.currentChampSkin = self.currentChamp.skins.randomElement()!.loading
    }
    
    func generateNextChampSkin() {
        self.nextChampSkin = self.nextChamp.skins.randomElement()!.loading
    }
}
