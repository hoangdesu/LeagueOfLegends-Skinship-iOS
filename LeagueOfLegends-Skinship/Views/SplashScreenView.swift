//
//  SplashScreenView.swift
//  LeagueOfLegends-Skinship
//
//  Created by ドロケ on 27/08/2022.
//

import SwiftUI

struct SplashScreenView: View {
    
    @Binding var appState: String
    
    let splashScreenDuration = 2.0
    
    var body: some View {
        ZStack {
            Text("Splash Screen")
            //                .onAppear {
            //                    withAnimation(.easeIn(duration: 1.5)) {
            //                        //                self.isActive
            //                    }
            //                }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + self.splashScreenDuration) {
                withAnimation(.easeIn(duration: 1.5)) {
                    self.appState = "home"
                }
                
            }
        }
    }
}

//struct SplashScreenView_Previews: PreviewProvider {
//static var previews: some View {
//    SplashScreenView(appState: .constant("splash"))
//}

