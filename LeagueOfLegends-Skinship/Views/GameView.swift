//
//  GameView.swift
//  LeagueOfLegends-Skinship
//
//  Created by ドロケ on 25/08/2022.
//

import SwiftUI

var champions = decodeJsonFromFile(jsonFileName: "champions.json")

struct GameView: View {
    
    // MARK: - PROPERTIES
    
    let haptics = UINotificationFeedbackGenerator()
    
    
    
    @State var currentChamp: Champion
    
    var choices: [Champion] {
        //        var randomChoices = [currentChamp, champions.randomElement()!, champions.randomElement()!, champions.randomElement()!]
        
        //        reels = reels.map({ _ in
        //            Int.random(in: 0...icons.count - 1)
        //        })
//
        var randomChoices: [Champion] = []
        
        for _ in 0..<4 {
            var randChamp = champions.randomElement()!
//            for champ in randomChoices {
//                if champ.id == randChamp.id {
//                    randChamp = champions.randomElement()!
//                    print("duplicated")
//                }
//            }
            randomChoices.append(randChamp)
        }
        
        let randInd = Int.random(in: 0..<4)
        print("RANDOM INDEX: \(randInd)")
        
        randomChoices[randInd] = currentChamp
//
//
        
//        var randomChoices = [currentChamp, champions.randomElement()!, champions.randomElement()!, champions.randomElement()!].shuffled()
//
//
            
//        for c in randomChoices {
//            print("RANDOM CHOICES: \(c.name)")
//        }
                    
        
        return randomChoices
    }
    
   
    
    
    // MARK: - GAME INIT STATE
    init(firstChamp: Champion) {
//
        _currentChamp = State(initialValue: firstChamp)
        print("CURRENT CHAMP INIT: \(currentChamp.name)")
        
    }
    
    
    
    // MARK: - FUNCTIONS
    
    func buttonTapHandler(choice: Champion) {
        print("CHOICE: \(choice.name)")
        //        let removedChamp = self.champions.remove(at: Int.random(in: 0..<champions.count))
        //        print(removedChamp)
//        print(champions.count)
//        print(currentChamp.defaultSkin)
        
        //        champions.remove
        
        currentChamp = getCurrentChamp()
        print("CURRENT CHAMP: \(currentChamp.name)")
        
    }
    
    func getRandomSkinFromCurrentChamp(champ: Champion) -> String {
        return champ.skins.randomElement()!.loading
    }
    
    func getCurrentChamp() -> Champion {
        let randomIndex = Int.random(in: 0..<champions.count)
        let randomChamp = champions[randomIndex]
        print("RANDOM CHAMP: \(randomChamp.name)")
        return randomChamp
    }
    
    
    
    
    //
    //    func test() {
    //        let fm = FileManager.default
    //        var path = Bundle.main.resourcePath!
    //
    //        print(path)
    //
    //        do {
    //            let items = try fm.contentsOfDirectory(atPath: path)
    //
    //            for item in items {
    //                print("Found \(item)")
    //
    //            }
    //        } catch {
    //            // failed to read directory – bad permissions, perhaps?
    //        }
    //    }
    
    
    //    func
    
    
    
    
    // MARK: - VIEW
    var body: some View {
        
        ZStack {
            Image("SR")
                .ignoresSafeArea(.all)
                .opacity(0.9)
                .blur(radius: 4)
            
            
            VStack {
                
                //                PlayCardView()
                
                Image(currentChamp.skins.randomElement()!.loading)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 400)
                //                    .cornerRadius(6)
                    .padding()
                
                
                VStack(spacing: 30) {
                    HStack {
                        Button {
                            
                            
                            buttonTapHandler(choice: choices[0])
                        } label: {
                            AnswerImageWrapper(image: choices[0].defaultSkin)
                        }
                        
                        Spacer()
                            .frame(width: 50)
                        
                        Button {
                            buttonTapHandler(choice: choices[1])
                        } label: {
                            AnswerImageWrapper(image: choices[1].defaultSkin)
                        }
                    }
                    
                    HStack {
                        Button {
                            buttonTapHandler(choice: choices[2])
                        } label: {
                            AnswerImageWrapper(image: choices[2].defaultSkin)
                        }
                        
                        Spacer()
                            .frame(width: 50)
                        
                        Button {
                            buttonTapHandler(choice: choices[3])
                            
                        } label: {
                            AnswerImageWrapper(image: choices[3].defaultSkin)
                        }
                    }
                }
                
            }
        }
        
        
        
        
        
    }
    
    
}


extension Array {
    func contains<T>(obj: T) -> Bool where T: Equatable {
        return !self.filter({$0 as? T == obj}).isEmpty
    }
}

//struct GameView_Previews: PreviewProvider {
//    static var previews: some View {
//        GameView(firstChamp: champions)
//    }
//}
