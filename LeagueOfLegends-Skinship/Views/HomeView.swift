//
//  HomepageView.swift
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

struct HomeView: View {
    
    @Binding var appState: String
    @Binding var gameMode: String
    
    var body: some View {
        ZStack {
            LoopingHomescreenVideoPlayerView()
                .ignoresSafeArea()
            
            VStack {
                Image("LeagueOfLegendsLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300)
                
                Spacer()
                
                Button {
                    withAnimation {
                        self.appState = "game"
                        self.gameMode = "normal"
                    }
                    playSoundEffect(sound: "gamestart", type: "mp3", volume: 1.0)
                } label: {
                    Image("playNormalBtn2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200)
                }
                
                Spacer()
                    .frame(height: 30)
                
                Button {
                    withAnimation(.easeOut(duration: 1)) {
                        self.appState = "game"
                        self.gameMode = "ranked"
                    }
                    playSoundEffect(sound: "gamestart", type: "mp3", volume: 1.0)
                } label: {
                    Image("playRankedBtn2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200)
                }
                
                Spacer()
                    .frame(height: 30)
                
                Button {
                    withAnimation {
                        self.appState = "tutorial"
                    }
                } label: {
                    Image("howToPlayBtn")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200)
                }
            }
            .padding()
            .padding(.top, 50)
            .padding(.bottom, 20)
        }
    }
}
