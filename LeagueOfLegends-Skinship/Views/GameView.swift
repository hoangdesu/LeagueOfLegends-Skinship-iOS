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
    
    
    
    
    
    // MARK: - VIEW
    var body: some View {
        
        ZStack {
            Image("background")
                .ignoresSafeArea(.all)
                .opacity(0.9)
                .blur(radius: 4)
            
            
            VStack {
                //                Color(.red)
                //                Text("Score: \(self.champVM.score)")
                
                
                
                VStack{
                    // MARK: - Heading
                    HStack {
                        Button(action: {
                            //                            self.resetGame()
                        }) {
                            Image(systemName: "arrow.2.circlepath.circle")
                        }
                        .modifier(ButtonModifier())
                        
                        Button(action: {
                            //                            self.resetGame()
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
                            
                            Text("\(1)")
                                .scoreNumberStyle()
                                .modifier(ScoreNumberModifier())
                        }
                        .modifier(ScoreContainerModifier())
                        
                        Spacer()
                            .frame(width: 80)
                        
                        // High score
                        HStack {
                            Text("200")
                                .scoreNumberStyle()
                                .modifier(ScoreNumberModifier())
                            
                            Text("High\nScore".uppercased())
                                .scoreLabelStyle()
                                .multilineTextAlignment(.leading)
                        }
                        .modifier(ScoreContainerModifier())
                    }
                }
                //                .offset(y: -20)
                //                .padding(.bottom, -20)
                
                
                
                
                
                // MARK: - Play Card View
                PlayCardView(champVM: self.champVM, frontImage: self.champVM.currentChampSkin, backImage: self.champVM.nextChampSkin)
                
                
                // MARK: - Selections
                VStack(spacing: 30) {
                    Text("What champion is this?")
                        .textLabelStyleWithFontSize(15)
                    
                    HStack {
                        Button {
                            self.champVM.gamePlayController(choice: champVM.choices[0])
                        } label: {
                            AnswerImageWrapper(image: champVM.choices[0].defaultSkin)
                        }
                        
                        Spacer()
                            .frame(width: 40)
                        
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
                            .frame(width: 40)
                        
                        Button {
                            self.champVM.gamePlayController(choice: champVM.choices[3])
                            
                        } label: {
                            AnswerImageWrapper(image: champVM.choices[3].defaultSkin)
                        }
                    }
                } // VStack
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
        .ignoresSafeArea(.all)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
