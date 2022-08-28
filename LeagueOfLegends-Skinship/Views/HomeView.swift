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
            Button {
                withAnimation {
                    self.appState = "game"
                    self.gameMode = "normal"
                }
            } label: {
                Text("NORMAL")
            }
            
            Button {
                withAnimation {
                    self.appState = "game"
                    self.gameMode = "ranked"
                }
            } label: {
                Text("RANKED")
            }
            }
            
        }
    }
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView(showingGame: )
//    }
//}
