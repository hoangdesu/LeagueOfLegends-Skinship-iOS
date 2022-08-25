//
//  GameView.swift
//  LeagueOfLegends-Skinship
//
//  Created by ドロケ on 25/08/2022.
//

import SwiftUI

struct GameView: View {
    
    // MARK: - PROPERTIES
    
    let haptics = UINotificationFeedbackGenerator()
    
    let tiles = ["Zed_0", "Ahri_0", "Yasuo_0", "Zoe_0", "Zyra_0"]
    let loadings = ["Zed_31", "Ezreal_25", "Draven_13", "Darius_8", "Caitlyn_29", "Ahri_5"]
    
    @State var champions: [Champion]
//    @State var currentChamp: Champion
    
    var myChamp: Champion {
        return champions[Int.random(in: 0..<champions.count)]
    }
    
    
    // MARK: - GAME INIT STATE
    init() {
        champions = decodeJsonFromFile(jsonFileName: "champions.json")
//        for champion in champions {
//            print(champion)
//        }
//        self.currentChamp = getChamp()
    }
    
    
    
    // MARK: - FUNCTIONS
    
    func buttonTapHandler(answer: String) {
        print("\(answer)")
        let removedChamp = self.champions.remove(at: Int.random(in: 0..<champions.count))
        print(removedChamp)
        print(champions.count)
        print(myChamp.defaultSkin)
        
//        champions.remove
        
    }
    
//    private static func getChamp() -> Champion {
//        return self.champions.remove(at: Int.random(in: 0..<champions.count))
//    }
    
    
    
    func test() {
        let fm = FileManager.default
        var path = Bundle.main.resourcePath!
        
        print(path)
        
        do {
            let items = try fm.contentsOfDirectory(atPath: path)
            
            for item in items {
                print("Found \(item)")
                
            }
        } catch {
            // failed to read directory – bad permissions, perhaps?
        }
    }
    
    
//    func
    
    
    
    
    func rollAnswer() {
        var choices = [tiles.randomElement(), tiles.randomElement(), tiles.randomElement(), tiles.randomElement()]
    }
    
    
    
    // MARK: - VIEW
    var body: some View {
        var choices = [tiles.randomElement(), tiles.randomElement(), tiles.randomElement(), tiles.randomElement()]
        
        ZStack {
            
            Image("SR")
                .ignoresSafeArea(.all)
                .opacity(0.9)
                .blur(radius: 4)
            
            
            
            
            VStack {
                
                
                
//                PlayCardView()
                
                Image()
                    .resizable()
                    .scaledToFit()
                    .frame(height: 400)
//                    .cornerRadius(6)
                    .padding()
                    
                
                VStack(spacing: 30) {
                    HStack {
                        Button {
                            
                            
                            
                            buttonTapHandler(answer: choices[0]!)
                        } label: {
                            AnswerImageWrapper(image: choices[0]!)
                        }
                        
                        Spacer()
                            .frame(width: 50)
                        
                        Button {
                            buttonTapHandler(answer: choices[1]!)
                        } label: {
                            AnswerImageWrapper(image: choices[1]!)
                        }
                    }
                    
                    
                    HStack {
                        Button {
                            buttonTapHandler(answer: choices[2]!)
                        } label: {
                            AnswerImageWrapper(image: choices[2]!)
                        }
                        
                        Spacer()
                            .frame(width: 50)
                        
                        Button {
                            buttonTapHandler(answer: choices[3]!)
                            
                        } label: {
                            AnswerImageWrapper(image: choices[3]!)
                        }
                    }
                }
                
            }
        }
        
        
        
        
        
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
