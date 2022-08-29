//
//  PlayCardView.swift
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
 Acknowledgement: https://github.com/zydeico/SlotMachine
 */

import SwiftUI

struct PlayCardView: View {
    @ObservedObject var champVM: ChampionViewModel
    @Binding var gameMode: String
    
    @State private var rotation: Double = 0
    @State private var showAnswer: Bool = false
    
    var body: some View {
        ZStack {
            ZStack {
                Image(self.champVM.currentChampSkin)
                    .scaleEffect(0.7)
                    .shadow(color: self.gameMode == "ranked" ? .red : .purple, radius: 10, x: 2, y: 2)
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                
            }
            .frame(height: 400)
            .rotation3DEffect(.degrees(rotation), axis: (x: 0, y: 1, z: 0))
            .onLongPressGesture {
                showAnswer.toggle()
            }
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true) { _ in
                    if self.champVM.isAnimating {
                        withAnimation(.easeOut(duration: 0.001)) {
                            if self.champVM.rotationDirection == -1.0 {
                                self.rotation -= 0.5
                            } else {
                                self.rotation += 0.5
                            }
                        }
                        
                        if self.rotation == 90 * self.champVM.rotationDirection || self.rotation == 270 * self.champVM.rotationDirection {
                            
                            // dark magic happens here: swap the front with the back image at flip point
                            self.champVM.correctAnswer = self.champVM.currentChamp.name
                            self.champVM.currentChamp = self.champVM.nextChamp
                            champVM.generateNextChamp()
                            self.champVM.generateCurrentChampSkin()
                            self.champVM.generateNextChampSkin()
                            
                            self.champVM.generate4RandomChoices()
                            
                            print("-- Current champ = \(self.champVM.currentChamp.name), Next champ = \(self.champVM.nextChamp.name)\n")
                            
                        } else if self.rotation == 360 * self.champVM.rotationDirection || self.rotation == 180 * self.champVM.rotationDirection {
                            self.champVM.isAnimating = false
//                                                        self.champVM.rotationDirection = -self.champVM.rotationDirection // nice bug/feature: card will spin for 1 full rotatation then change image
                        }
                        
                        if self.rotation == 360 * self.champVM.rotationDirection {
                            self.rotation = 0
                        }
                    }
                }
            }
            if showAnswer {
                Text("\(self.champVM.currentChamp.name)")
                    .foregroundColor(.white)
                    .font(.system(size: 15, weight: .bold, design: .rounded))
                    .background(.brown)
            }
        }
    }
}

struct PlayCardView_Previews: PreviewProvider {
    @StateObject static var champVM = ChampionViewModel()
    static var previews: some View {
        GameView(champVM: self.champVM, appState: .constant(.game), gameMode: .constant("ranked"))
    }
}
