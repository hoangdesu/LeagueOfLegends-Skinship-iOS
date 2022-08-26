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
    @Published var score: Int = 0
    @Published var choices: [Champion] = []
    
    
    init() {
        self.resetGameState()
    }
    
    func generateCurrentChamp() {
        self.currentChamp = champions.randomElement()!
        
        print("\n[GET CURRENT CHAMP]: \(self.currentChamp.name)")
    }
    
    
    func generate4RandomChoices() {
        self.choices = [self.currentChamp, champions.randomElement()!, champions.randomElement()!, champions.randomElement()!].shuffled()
        
        while self.hasDuplicatedChoices() {
            self.choices = [self.currentChamp, champions.randomElement()!, champions.randomElement()!, champions.randomElement()!].shuffled()
        }
        
        print("4 choices: ", terminator: "")
        for choice in choices {
            print("\(choice.name)", terminator: ", ")
        }
        print()
    }
    
    func resetGameState() {
        self.generateCurrentChamp()
        self.generate4RandomChoices()
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
    
    
}
