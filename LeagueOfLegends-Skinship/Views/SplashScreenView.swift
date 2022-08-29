//
//  SplashScreenView.swift
//  LeagueOfLegends-Skinship
//
//  Created by ドロケ on 27/08/2022.
//

/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2022B
 Assessment: Assignment 2
 Author: Hoang Nguyen
 ID: s3697305
 Last modified: 29/08/2022
 */

import SwiftUI
import AVKit

struct SplashScreenView: View {
    
    @State var introPlayer = AVPlayer()
    
    @Binding var appState: String
    
    let splashScreenDuration = 8.0 // use 8.0 for production
    
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea(.all)
            
            VideoPlayer(player: introPlayer)
                .onAppear() {
                    introPlayer = AVPlayer(url: Bundle.main.url(forResource: "splash-intro", withExtension: "mp4")!)
                    introPlayer.volume = 1.0
                    introPlayer.play()
                }
                .scaleEffect(1.5)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + self.splashScreenDuration) {
                withAnimation(.easeIn(duration: 2.0)) {
                    self.appState = "home"
                }
            }
        }
    }
}
