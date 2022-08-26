//
//  PlayCardView.swift
//  LeagueOfLegends-Skinship
//
//  Created by ドロケ on 25/08/2022.
//

import SwiftUI

struct PlayCardView: View {
//    @State private var animating = false
    @State private var isImageFlipped = false
    @State private var rotation: Double = 0
    
    @ObservedObject var champVM: ChampionViewModel
    
    @State private var frontImage: String = ""
    @State private var backImage: String = ""
    
    init(champVM: ChampionViewModel) {
        self.champVM = champVM
        self.frontImage = self.champVM.currentChampSkin
        self.backImage = self.champVM.nextChampSkin
    }
    
    
    var rotationDirection = -1.0 // 1.0: left to right, -1.0: right to left
    
    var body: some View {
        ZStack {
            if isImageFlipped {
                Image(self.backImage)
                    .scaleEffect(0.6)
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
            } else {
                Image(self.frontImage)
                    .scaleEffect(0.6)
            }
        }
        .rotation3DEffect(.degrees(rotation), axis: (x: 0, y: 1, z: 0))
        .onTapGesture {
            withAnimation(Animation.easeOut(duration: 0.5)) {
//                self.animating.toggle()
                self.champVM.isAnimating.toggle()
            }
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true) { _ in
//                if self.animating {
                if self.champVM.isAnimating {
                    withAnimation(.easeOut(duration: 0.001)) {
                        if self.rotationDirection == -1.0 {
                            self.rotation -= 0.5
                        } else {
                            self.rotation += 0.5
                        }
                        
                    }
                    if self.rotation == 90 * self.rotationDirection || self.rotation == 270 * self.rotationDirection {
//                        self.isImageFlipped.toggle()
                        self.frontImage = self.backImage
                        self.backImage = self.champVM.nextChampSkin
                    } else if self.rotation == 360 * self.rotationDirection || self.rotation == 180 * self.rotationDirection {
//                        self.animating = false
                        self.champVM.isAnimating = false
                    }
                    
                    if self.rotation == 360 * self.rotationDirection {
                        self.rotation = 0
                    }
                }
            }
        }
    }
}
//
//struct PlayCardView_Previews: PreviewProvider {
//    @ObservedObject var champVM = ChampionViewModel()
//
//    static var previews: some View {
//        PlayCardView(champVM: champVM)
//    }
//}
