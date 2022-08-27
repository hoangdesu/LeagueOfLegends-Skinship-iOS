//
//  HomepageView.swift
//  LeagueOfLegends-Skinship
//
//  Created by ドロケ on 27/08/2022.
//

import SwiftUI

struct HomeView: View {
    @Binding var showingGame: Bool
    
    var body: some View {
        Button {
            withAnimation {
                self.showingGame = true
            }
        } label: {
            Text("Click to play")
        }
         
    }
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView(showingGame: )
//    }
//}
