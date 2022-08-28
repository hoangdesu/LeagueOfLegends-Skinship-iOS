//
//  GameView.swift
//  LeagueOfLegends-Skinship
//
//  Created by ドロケ on 25/08/2022.
//

import SwiftUI

struct GameView: View {
    
    // MARK: - PROPERTIES
    
    @StateObject var champVM = ChampionViewModel()
    
    @Binding var appState: String
    @Binding var gameMode: String
    
    @State private var showResetHighscoreAlert = false
    @State private var showInfoSheet = false
    
    
    // MARK: - FUNCTIONS
    
    func buttonTapHandler(choice: Champion) {
        self.champVM.gamePlayController(choice: choice, gameMode: self.gameMode)
    }
    
    
    // MARK: - VIEW
    var body: some View {
        
        ZStack {
            Image("background")
            
                .resizable()
            
                .aspectRatio(contentMode: .fill)
                .opacity(0.9)
                .blur(radius: 4)
                .ignoresSafeArea()
                .scaleEffect(1.2)
                .offset(x: 50)
            
            
            VStack {
                //                                Color(.red)
                //                Text("Score: \(self.champVM.score)")
                
                
                VStack {
                    
                    // MARK: - Header
                    HStack {
                        Button(action: {
                            withAnimation {
                                self.appState = "home"
                            }
                        }) {
                            Image(systemName: "arrow.2.circlepath.circle")
                        }
                        .modifier(ButtonModifier())
                        
                        Button(action: {
                            self.showInfoSheet = true
                        }) {
                            Image(systemName: "info.circle")
                        }
                        .modifier(ButtonModifier())
                        
                        Text("Game mode: \(self.gameMode)")
                    }
                    
                    // MARK: - Scores
                    HStack {
                        // Your score
                        HStack {
                            Text("Your\nscore")
                                .scoreLabelStyle()
                                .multilineTextAlignment(.trailing)
                            
                            Text("\(self.champVM.score)")
                                .scoreNumberStyle()
                                .modifier(ScoreNumberModifier())
                        }
                        .modifier(ScoreContainerModifier())
                        
                        if gameMode == "ranked" {
                            Spacer()
                                .frame(width: 80)
                            
                            // High score
                            HStack {
                                Text("\(self.champVM.highscore)")
                                    .scoreNumberStyle()
                                    .modifier(ScoreNumberModifier())
                                    .onAppear {
                                        //                                    self.champVM.highscore = UserDefaults.standard.integer(forKey: "highScore")
                                    }
                                
                                
                                Text("High\nScore".uppercased())
                                    .scoreLabelStyle()
                                    .multilineTextAlignment(.leading)
                            }
                            .modifier(ScoreContainerModifier())
                            .onTapGesture {
                                //                                    self.champVM.highscore = 0
                                self.showResetHighscoreAlert = true
                            }
                            .alert("Warning!", isPresented: $showResetHighscoreAlert, actions: {
                                Button("Reset", role: .destructive) {
                                    self.champVM.highscore = 0
                                }
                            }, message: {
                                Text("Do you want to reset high score?")
                            })
                        }
                    }}
                //                .offset(y: -20)
                //                .padding(.bottom, -20)
                
                
                // MARK: - Play Card View
                PlayCardView(champVM: self.champVM)
                
                
                // MARK: - Selections
                VStack(spacing: 20) {
                    Text("What champion is this?")
                        .textLabelStyleWithFontSize(15)
                        .foregroundColor(.red)
                    
                    HStack {
                        Button {
                            self.buttonTapHandler(choice: champVM.choices[0])
                            
                        } label: {
                            AnswerImageWrapper(image: champVM.choices[0].defaultSkin)
                        }
                        
                        Spacer()
                            .frame(width: 50)
                        
                        Button {
                            self.buttonTapHandler(choice: champVM.choices[1])
                        } label: {
                            AnswerImageWrapper(image: champVM.choices[1].defaultSkin)
                        }
                    }
                    
                    HStack {
                        Button {
                            self.buttonTapHandler(choice: champVM.choices[2])
                        } label: {
                            AnswerImageWrapper(image: champVM.choices[2].defaultSkin)
                        }
                        
                        Spacer()
                            .frame(width: 50)
                        
                        Button {
                            self.buttonTapHandler(choice: champVM.choices[3])
                        } label: {
                            AnswerImageWrapper(image: champVM.choices[3].defaultSkin)
                        }
                    }
                } // VStack
                .padding(.top, 10)
            } // VStack
            .blur(radius: self.champVM.showGameViewRankedStopModal ? 5 : 0, opaque: false)
            
            
            // MARK: - Pop Up
            if self.champVM.showGameViewRankedStopModal {
                ModalView(champVM: self.champVM)
            }
            
            
            
            
        } // ZStack
        .onAppear {
            self.champVM.resetGameState()
            playBackgroundMusic(music: "SR - Early Game")
        }
        .sheet(isPresented: $showInfoSheet) {
            InfoSheetView(champVM: self.champVM)
        }
        
    }
    
}

//struct GameView_Previews: PreviewProvider {
//    static var previews: some View {
//        GameView()
//    }
//}
