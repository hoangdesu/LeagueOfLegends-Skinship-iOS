//
//  ChampionViewModel.swift
//  LeagueOfLegends-Skinship
//
//  Created by ドロケ on 26/08/2022.
//

import Foundation

class ChampionViewModel: ObservableObject {
    @Published var currentChamp: Champion = champions[0]
    @Published var nextChamp = champions[1]
    
    @Published var currentChampSkin = ""
    @Published var nextChampSkin = ""
    
    @Published var choices: [Champion] = []
    @Published var score: Int = 0
    
    // animation states
    @Published var isAnimating = false
    
    init() {
        self.resetGameState()
    }
    
    func gamePlayController() {
        self.isAnimating.toggle()
        
        self.currentChamp = self.nextChamp
        self.nextChamp = champions.randomElement()!
        
        self.generateCurrentChampSkin()
        self.generateNextChampSkin()
        
        self.generate4RandomChoices()
        
        print("-- Current champ = \(self.currentChamp.name), Next champ = \(nextChamp.name)")
        
        
    }
    
    func generateCurrentChamp() {
        self.currentChamp = champions.randomElement()!
        
        print("\n[GET CURRENT CHAMP]: \(self.currentChamp.name)")
        
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
        
        print("4 choices: ", terminator: "")
        for choice in choices {
            print("\(choice.name)", terminator: ", ")
        }
        print()
    }
    
    func resetGameState() {
        self.generateCurrentChamp()
        self.generateCurrentChampSkin()
        self.generate4RandomChoices()
        self.generateNextChampSkin()
        self.generateNextChamp()
        self.score = 0
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
        
        print("NEXT CHAMP: \(self.nextChamp.name)")
    }
    
    
    func hasDuplicatedChoices() -> Bool {
        var seen = [String: String]()
        
        for i in 0..<self.choices.count {
            let keyExists = seen[self.choices[i].id] != nil
            if keyExists {
                print("-- has duplicated choices --")
                return true
            } else {
                let id = self.choices[i].id
                seen[id] = id
            }
        }
        return false
    }
    
    func swapNextChampWithCurrentChamp() {
        self.currentChamp = self.nextChamp
        generateNextChamp()
        
        while self.nextChamp.id == self.currentChamp.id {
            generateNextChamp()
        }
    }
    
    func generateCurrentChampSkin() {
        self.currentChampSkin = self.currentChamp.skins.randomElement()!.loading
        print("Current champ skin: \(self.currentChampSkin)")
    }
    
    func generateNextChampSkin() {
        self.nextChampSkin = self.nextChamp.skins.randomElement()!.loading
        print("Next champ skin: \(self.nextChampSkin)")
    }
    
    
    
    
}
