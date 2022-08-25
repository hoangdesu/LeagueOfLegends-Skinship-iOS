//
//  PlayCardView.swift
//  LeagueOfLegends-Skinship
//
//  Created by ドロケ on 25/08/2022.
//

import SwiftUI

struct PlayCardView: View {
    @State private var animating = false
    @State private var isImageFlipped = false
    @State private var rotation: Double = 0
    
    var body: some View {
        ZStack {
            if isImageFlipped {
                 Image("Zed_31")
                    .scaleEffect(0.6)
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
            } else {
                Image("Ahri_5")
                    .scaleEffect(0.6)
            }
        }
        .rotation3DEffect(.degrees(rotation), axis: (x: 0, y: 1, z: 0))
        .onTapGesture {
            withAnimation(Animation.easeOut(duration: 0.5)) {
                self.animating.toggle()
            }
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true) { _ in
                if self.animating {
                    withAnimation(.easeOut(duration: 0.001)) {
                        self.rotation -= 0.5
                    }
                    if self.rotation == -90 || self.rotation == -270 {
                        self.isImageFlipped.toggle()
                    } else if self.rotation == -360 || self.rotation == -180 {
                        self.animating = false
                    }
                    
                    if self.rotation == -360 {
                        self.rotation = 0
                    }
                }
            }
        }
    }
}

struct PlayCardView_Previews: PreviewProvider {
    static var previews: some View {
        PlayCardView()
    }
}
