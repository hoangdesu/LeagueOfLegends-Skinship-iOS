//
//  ModalView.swift
//  LeagueOfLegends-Skinship
//
//  Created by ドロケ on 29/08/2022.
//

import SwiftUI

struct ModalView: View {
    @ObservedObject var champVM: ChampionViewModel
    
    @State var playerName: String = ""
    
    var body: some View {
        
        ZStack {
            Color("ColorTransparentBlack")
                .edgesIgnoringSafeArea(.all)
            
            // Modal
            VStack(spacing: 0) {
                // Title
                Text(self.champVM.hasNewTopPlayer ? "Victory!" : "Defeat")
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.heavy)
                    .padding()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(self.champVM.hasNewTopPlayer ? Color(.systemPink) : Color(.systemGray))
                    .foregroundColor(Color.white)
                
                Spacer()
                
                VStack(alignment: .center
                       , spacing: 16) {
                    Image(self.champVM.hasNewTopPlayer ? "zedSticker" : "amumuSticker")
                        .resizable()
                        .scaledToFit()
                        .frame(maxHeight: 100)
                    
                    Text("Correct answer: \(self.champVM.correctAnswer)")
                        .font(.system(.body, design: .rounded))
                        .lineLimit(2)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.gray)
                        .layoutPriority(1)
                    
                    if self.champVM.hasNewTopPlayer {
                        TextField("Enter your username", text: self.$playerName)
                            .multilineTextAlignment(.center)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal, 20)
                            
                    }
                    
                    Button(action: {
                        if self.champVM.hasNewTopPlayer {
                            if playerName == "" {
                                return
                            }
                            self.champVM.topPlayer = playerName
                        }
                        
                        withAnimation(Animation.easeOut(duration: 0.5)) {
                            self.champVM.animatingRankedStopModal = false
                            self.champVM.showRankedModeResultModal = false
                        }
                        
                        self.champVM.resetGameState()
                        
                    }) {
                        Text("Play again".uppercased())
                            .font(.system(.body, design: .rounded))
                            .fontWeight(.semibold)
                            .accentColor(Color(.systemIndigo))
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .frame(minWidth: 128)
                            .background(
                                Capsule()
                                    .strokeBorder(lineWidth: 2.0)
                                    .foregroundColor(self.champVM.hasNewTopPlayer ? Color(.systemPink) : Color(.systemGray))
                            )
                    }
                    .padding(.bottom, 10)
                }
                Spacer()
            }
            .frame(minWidth: 280, idealWidth: 280, maxWidth: 320, minHeight: 260, idealHeight: 280, maxHeight: 320, alignment: .center)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: Color("ColorTransparentBlack"), radius: 6, x: 0, y: 8)
            .opacity(self.champVM.animatingRankedStopModal ? 1 : 0)
            .offset(y: self.champVM.animatingRankedStopModal ? 0 : -100)
            .animation(Animation.spring(response: 0.6, dampingFraction: 1.0, blendDuration: 1.0), value: self.champVM.animatingRankedStopModal)
            .onAppear(perform: {
                self.champVM.animatingRankedStopModal = true
                if self.champVM.hasNewTopPlayer {
                    playSoundEffect(sound: "Victory", type: "mp3", volume: 1.0)
                } else {
                    playSoundEffect(sound: "Defeat", type: "mp3", volume: 1.0)
                }
            })
            .onDisappear {
                self.champVM.showRankedModeResultModal = false
                self.champVM.animatingRankedStopModal = false
            }
        }
    }
}

//struct ModalView_Previews: PreviewProvider {
//    static var previews: some View {
//        ModalView(champVM: <#T##ChampionViewModel#>)
//    }
//}
