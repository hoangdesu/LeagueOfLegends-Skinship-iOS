//
//  HomepageView.swift
//  LeagueOfLegends-Skinship
//
//  Created by ドロケ on 27/08/2022.
//

import SwiftUI

struct HomeView: View {
    
    //    app states
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
                } label: {
                    Image("playNormalBtn2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200)
                }
                
                Spacer()
                    .frame(height: 30)
                
                Button {
                    withAnimation {
                        self.appState = "game"
                        self.gameMode = "ranked"
                    }
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
//            .overlay(
//                Image(systemName: !self.isMuted ? "speaker.slash" : "speaker")
//                    .font(.system(size: 20, weight: .regular, design: .rounded))
//                    .onTapGesture {
//                        self.isMuted.toggle()
//                    }
//            )
            
        }
        
            
    }
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView(appState: .constant("home"), gameMode: .constant("normal"))
//    }
//}
