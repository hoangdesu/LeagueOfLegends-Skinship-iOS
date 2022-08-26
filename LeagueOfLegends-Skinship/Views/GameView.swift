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
    
    @StateObject var champVM = ChampionViewModel()
    
    
    // MARK: - FUNCTIONS
    
    func buttonTapHandler(choice: Champion) {
        
//        self.champVM.generateCurrentChamp()
//        self.champVM.generate4RandomChoices()
//        self.champVM.generateNextChamp()
        
        self.champVM.gamePlayController()
        
        
    }
    
    
    
    // MARK: - VIEW
    var body: some View {
        
        ZStack {
            Image("SR")
                .ignoresSafeArea(.all)
                .opacity(0.9)
                .blur(radius: 4)
            
            
            VStack {
                
                Text("\(1)")
                
                PlayCardView(champVM: champVM)
                
//
                
//                Image(champVM.getRandomSkinFromCurrentChamp())
//                    .resizable()
//                    .scaledToFit()
//                    .frame(height: 400)
//                //                    .cornerRadius(6)
//                    .padding()
                
                
                VStack(spacing: 30) {
                    HStack {
                        Button {
                            buttonTapHandler(choice: champVM.choices[0])
                        } label: {
                            AnswerImageWrapper(image: champVM.choices[0].defaultSkin)
                        }
                        
                        Spacer()
                            .frame(width: 50)
                        
                        Button {
                            buttonTapHandler(choice: champVM.choices[1])
                        } label: {
                            AnswerImageWrapper(image: champVM.choices[1].defaultSkin)
                        }
                    }
                    
                    HStack {
                        Button {
                            buttonTapHandler(choice: champVM.choices[2])
                        } label: {
                            AnswerImageWrapper(image: champVM.choices[2].defaultSkin)
                        }

                        Spacer()
                            .frame(width: 50)

                        Button {
                            buttonTapHandler(choice: champVM.choices[3])

                        } label: {
                            AnswerImageWrapper(image: champVM.choices[3].defaultSkin)
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

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
