//
//  PlayCardView.swift
//  LeagueOfLegends-Skinship
//
//  Created by ドロケ on 25/08/2022.
//

import SwiftUI

struct PlayCardView: View {
    @ObservedObject var champVM: ChampionViewModel
    
    @State private var frontImage: String
    @State private var backImage: String
    @State private var rotation: Double = 0
    @State private var showAnswer: Bool = false
    
    init(champVM: ChampionViewModel, frontImage: String, backImage: String) {
        self.champVM = champVM
        self.frontImage = frontImage
        self.backImage = backImage
    }
    
    var body: some View {
        ZStack {
            ZStack {
                Image(self.frontImage)
                    .scaleEffect(0.7)
                    .shadow(color: .green, radius: 10, x: 2, y: 2)
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                
            }
            .frame(height: 400)
            .rotation3DEffect(.degrees(rotation), axis: (x: 0, y: 1, z: 0))
            .onLongPressGesture {
                showAnswer.toggle()
            }
            //        .onTapGesture {
            //            withAnimation(Animation.easeOut(duration: 0.5)) {
            //                //                self.animating.toggle()
            ////                self.champVM.isAnimating.toggle()
            //            }
            //        }
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true) { _ in
                    //                if self.animating {
                    if self.champVM.isAnimating {
                        withAnimation(.easeOut(duration: 0.001)) {
                            if self.champVM.rotationDirection == -1.0 {
                                self.rotation -= 0.5
                            } else {
                                self.rotation += 0.5
                            }
                        }
                        
                        if self.rotation == 90 * self.champVM.rotationDirection || self.rotation == 270 * self.champVM.rotationDirection {
                            
                            // dark magic happens here: swap the front with the back image at flip point and get new back image
                            self.frontImage = self.backImage
                            self.backImage = self.champVM.nextChampSkin
                            
                            
                        } else if self.rotation == 360 * self.champVM.rotationDirection || self.rotation == 180 * self.champVM.rotationDirection {
                            self.champVM.isAnimating = false
//                            self.champVM.rotationDirection = -self.champVM.rotationDirection // nice bug/feature: card will spin for 1 full rotatation then change image
                        }
                        
                        if self.rotation == 360 * self.champVM.rotationDirection {
                            self.rotation = 0
                            //                        self.rotationDirection = -self.rotationDirection
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
//
struct PlayCardView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
