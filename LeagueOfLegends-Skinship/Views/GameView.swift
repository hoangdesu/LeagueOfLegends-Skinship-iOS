//
//  GameView.swift
//  LeagueOfLegends-Skinship
//
//  Created by ドロケ on 25/08/2022.
//

import SwiftUI

struct GameView: View {
    
    // MARK: - PROPERTIES
    
    @ObservedObject var champVM: ChampionViewModel
    
    @Binding var appState: String
    
    @State var showResetHighscoreAlert = false
    @State var showInfoSheet = false
    
    
    // MARK: - FUNCTIONS
    
    
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
                }
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
                            self.champVM.gamePlayController(choice: champVM.choices[0])
                            
                        } label: {
                            AnswerImageWrapper(image: champVM.choices[0].defaultSkin)
                        }
                        
                        Spacer()
                            .frame(width: 50)
                        
                        Button {
                            self.champVM.gamePlayController(choice: champVM.choices[1])
                        } label: {
                            AnswerImageWrapper(image: champVM.choices[1].defaultSkin)
                        }
                    }
                    
                    HStack {
                        Button {
                            self.champVM.gamePlayController(choice: champVM.choices[2])
                        } label: {
                            AnswerImageWrapper(image: champVM.choices[2].defaultSkin)
                        }
                        
                        Spacer()
                            .frame(width: 50)
                        
                        Button {
                            self.champVM.gamePlayController(choice: champVM.choices[3])
                            
                        } label: {
                            AnswerImageWrapper(image: champVM.choices[3].defaultSkin)
                        }
                    }
                } // VStack
                .padding(.top, 10)
            } // VStack
            //            // MARK: - Buttons
            //            .overlay(
            //                // Reset
            //                Button(action: {
            ////                        self.resetGame()
            //                }) {
            //                    Image(systemName: "arrow.2.circlepath.circle")
            //                }
            //                .modifier(ButtonModifier()), alignment: .topLeading
            //        )
            //            .overlay(
            //                // Info
            //                Button(action: {
            ////                        self.showingInfoView = true
            //                }) {
            //                    Image(systemName: "info.circle")
            //                }
            //                .modifier(ButtonModifier()), alignment: .topTrailing
            //        )
            //            .padding()
            //            .frame(maxWidth: 720)
            ////
            ////                // MARK: - Blur efect
            ////                .blur(radius: $showingModal.wrappedValue ? 5 : 0, opaque: false)
            //
            ////                .overlay(
            ////                    Text("Overlay")
            ////                )
        } // ZStack
        .onAppear {
            self.champVM.resetGameState()
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
