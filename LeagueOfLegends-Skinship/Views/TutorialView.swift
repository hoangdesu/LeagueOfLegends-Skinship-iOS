//
//  TutorialView.swift
//  LeagueOfLegends-Skinship
//
//  Created by ドロケ on 29/08/2022.
//

import SwiftUI

struct TutorialView: View {
    @Binding var appState: String
    
    var body: some View {
        ZStack {
            
            Image("summonersRift")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200)
                .opacity(0.6)
                .blur(radius: 10, opaque: true)
                .ignoresSafeArea(.all)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    
                    HStack(alignment: .center) {
                        Spacer()
                        Text("Tutorial")
                            .font(.system(size: 50, weight: .bold, design: .rounded))
                        Spacer()
                            .padding(.vertical, 50)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Gameplay")
                            .font(.title)
                            .bold()
                        
                        Text("League of Legends: Skinship is based on the popular MOBA game \"League of Legends\" from Riot Games. Its gameplay is indeed very simple, a custom skin of a random will be spawn in the middle of the screen, among with 4 possible champions. Player will need to pick the correct champion of which the skin being displayed belongs to.")
                        
                        Spacer()
                            .frame(height: 20)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Game modes")
                            .font(.title)
                            .bold()
                        
                        Text("1. Normal mode")
                            .font(.headline)
                        
                        Image("normalMode")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 300)
                        
                        Text("Free play mode. Player will score when select the correct champion and only lose score when select the wrong one. Card will rotate right if you select the correct champion and rotate left if you didn't get it right.")
                        
                        Spacer()
                            .frame(height: 10)
                        
                        Text("2. Ranked mode")
                            .font(.headline)
                        
                        Image("rankedMode")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 300)
                        
                        Text("Similar gameplay with normal mode, instead in this mode you will **lose the game** if you pick the wrong one. On top of that, player will a chance to mark their name as the Top player of the game by beating the current high score.")
                        
                        Spacer()
                            .frame(height: 20)
                    }
                    
                    Text("Music")
                        .font(.title)
                        .bold()
                    
                    Text("The game is packed with iconic songs from League. Feel free to choose the song you would like to listen to while playing the game under the Infofmation section.")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                
                Button {
                    withAnimation {
                        self.appState = "home"
                    }
                } label: {
                    Image("backBtn")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150)
                }
                .padding(20)
            }
        }
    }
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView(appState: .constant("tutorial"))
    }
}
