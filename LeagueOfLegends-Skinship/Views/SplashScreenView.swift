//
//  SplashScreenView.swift
//  LeagueOfLegends-Skinship
//
//  Created by ドロケ on 27/08/2022.
//

import SwiftUI
import AVKit

struct SplashScreenView: View {
    
    @Binding var appState: String
    
    let splashScreenDuration = 8.0 // use 8.0 for production
    
    let video = "intro"
    @State var introPlayer = AVPlayer()
    
    
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
//
//struct AVPlayerControllerRepresented: NSViewRepresentable {
//    var player : AVPlayer
//
//    func makeNSView(context: Context) -> AVPlayerView {
//        let view = AVPlayerView()
//        view.controlsStyle = .none
//        view.player = player
//        return view
//    }
//
//    func updateNSView(_ nsView: AVPlayerView, context: Context) {
//
//    }
//}

//struct SplashScreenView_Previews: PreviewProvider {
//static var previews: some View {
//    SplashScreenView(appState: .constant("splash"))
//}

