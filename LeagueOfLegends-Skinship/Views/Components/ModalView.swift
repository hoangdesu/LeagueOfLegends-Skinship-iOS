//
//  ModalView.swift
//  LeagueOfLegends-Skinship
//
//  Created by ドロケ on 29/08/2022.
//

import SwiftUI

struct ModalView: View {
    @ObservedObject var champVM: ChampionViewModel
    
    var body: some View {
        
        ZStack {
            Color("ColorTransparentBlack")
                .edgesIgnoringSafeArea(.all)
            
            // Modal
            VStack(spacing: 0) {
                // Title
                Text("Game Over")
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.heavy)
                    .padding()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(Color("ColorPink"))
                    .foregroundColor(Color.white)
                
                Spacer()
                
                VStack(alignment: .center
                , spacing: 16) {
//                    Image("gfx-seven-reel")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(maxHeight: 72)
                    Text("Bad luck! You lost all of the coins. \nLet's play again!")
                        .font(.system(.body, design: .rounded))
                        .lineLimit(2)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.gray)
                        .layoutPriority(1)
                    
                    Button(action: {
//                        self.showingModal = false
//                        self.animatingModal = false
//                        self.activateBet10()
//                        self.coins = 100
                        withAnimation(Animation.easeOut(duration: 0.5)) {
                        self.champVM.animatingRankedStopModal = false
                        self.champVM.showGameViewRankedStopModal = false
                        }
                        
                        self.champVM.resetGameState()
                        
                    }) {
                        Text("New Game".uppercased())
                            .font(.system(.body, design: .rounded))
                            .fontWeight(.semibold)
                            .accentColor(Color("ColorPink"))
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .frame(minWidth: 128)
                            .background(
                                Capsule()
                                    .strokeBorder(lineWidth: 1.75)
                                    .foregroundColor(Color("ColorPink"))
                        )
                    }
                }
                Spacer()
            }
            .frame(minWidth: 280, idealWidth: 280, maxWidth: 320, minHeight: 260, idealHeight: 280, maxHeight: 320, alignment: .center)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: Color("ColorTransparentBlack"), radius: 6, x: 0, y: 8)
            .opacity(self.champVM.animatingRankedStopModal ? 1 : 0)
            .offset(y: self.champVM.animatingRankedStopModal ? 0 : -100)
            .animation(Animation.spring(response: 0.6, dampingFraction: 1.0, blendDuration: 1.0))
            .onAppear(perform: {
                self.champVM.animatingRankedStopModal = true
            })
        }
    }
}

//struct ModalView_Previews: PreviewProvider {
//    static var previews: some View {
//        ModalView(champVM: <#T##ChampionViewModel#>)
//    }
//}
