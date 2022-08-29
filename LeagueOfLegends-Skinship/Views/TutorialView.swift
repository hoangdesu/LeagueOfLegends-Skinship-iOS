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
        
        
        Text("Tutorial")
        
        
        Button {
            withAnimation {
                self.appState = "home"
            }
        } label: {
            Text("Back to home")
        }
    }
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView(appState: .constant("tutorial"))
    }
}
