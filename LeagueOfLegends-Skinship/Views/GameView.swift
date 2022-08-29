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
    
    
    @State private var showInfoSheet = false
    @State private var showTopPlayerAlert = false
    @State private var showResetGameAlert = false
    @State private var isMuted = false
    @State private var showConfirmExitRankedGameAlert = false
    
    
    
    // MARK: - FUNCTIONS
    
    func buttonTapHandler(choice: Champion) {
        self.champVM.gamePlayController(choice: choice, gameMode: self.gameMode)
    }
    
    
    // MARK: - VIEW
    var body: some View {
        
        ZStack {
            Image(self.gameMode == "ranked" ? "summonersRift" : "twistedTreeLine")
            
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
                    HStack(alignment: .center) {
                        // home
                        Button(action: {
                            if self.gameMode == "ranked" {
                                self.showConfirmExitRankedGameAlert = true
                            } else {
                                withAnimation {
                                    self.appState = "home"
                                }
                            }
                        }) {
                            Image("LoLicon")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 35)
                                .padding(.leading, 10)
                        }
                        .modifier(ButtonModifier())
                        
                        Spacer()
                        
                        HStack(spacing: 20) {
                            
                            // game mode
                            //                            Text("\(self.gameMode.capitalized) mode")
                            //                                .font(.headline)
                            //                                .foregroundColor(self.gameMode == "ranked" ? .red : .yellow)
                            //                                .shadow(color: .white, radius: 5, x: 0, y: 0)
                            
                            // reset game
                            Button(action: {
                                withAnimation {
                                    self.showResetGameAlert = true
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
                            
                            // mute background music
                            Button(action: {
                                // playing
                                if self.champVM.backgroundMusicVolume > 0 {
                                    self.champVM.backgroundMusicVolume = 0
                                    
                                    self.isMuted = true
                                } else {
                                    self.champVM.backgroundMusicVolume = 0.69
                                    self.isMuted = false
                                }
                                backgroundMusicPlayer?.setVolume(Float(self.champVM.backgroundMusicVolume), fadeDuration: 0.0)
                                
                            }) {
                                Image(systemName: self.isMuted ? "speaker.slash" : "speaker.2")
                            }
                            .modifier(ButtonModifier())
                            
                        }
                    }
                    .frame(width: 350)
                    .offset(y: -10)
                    .padding(.horizontal)
                    // reset game alert
                    .alert("Do you want to reset game?", isPresented: $showResetGameAlert) {
                        Button("Reset", role: .destructive) {
                            self.champVM.resetGameState()
                        }
                        Button("Cancel", role: .cancel) { }
                    }
                    // show confirm exit ranked game alert - only available in ranked mode
                    .alert("You are in ranked game.\nDo you want to exit the game?", isPresented: $showConfirmExitRankedGameAlert) {
                        Button("Exit", role: .destructive) {
                            withAnimation {
                                self.appState = "home"
                            }
                        }
                        Button("Keep playing", role: .cancel) { }
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
                                .frame(width: 75)
                            
                            // High score
                            HStack {
                                Text("\(self.champVM.highscore)")
                                    .scoreNumberStyle()
                                    .modifier(ScoreNumberModifier())
                                
                                
                                Text("High\nScore".uppercased())
                                    .scoreLabelStyle()
                                    .multilineTextAlignment(.leading)
                            }
                            .modifier(ScoreContainerModifier())
                            .onTapGesture {
                                self.showTopPlayerAlert = true
                            }
                            
                            // display current top player
                            .alert("Current top player: \(self.champVM.topPlayer)", isPresented: $showTopPlayerAlert) {
                                Button("Nice", role: .cancel) { }
                            }
                        }
                    }}

                
                // MARK: - Play Card View
                PlayCardView(champVM: self.champVM, gameMode: self.$gameMode)
                
                
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
            if self.gameMode == "ranked" {
                playBackgroundMusic(music: "SR - Late Game")
                
            } else {
                playBackgroundMusic(music: "SR - Early Game")
            }
            
        }
        .onDisappear {
            backgroundMusicPlayer?.stop()
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
