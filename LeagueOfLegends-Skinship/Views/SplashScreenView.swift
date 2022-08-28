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
    
    let splashScreenDuration = 7.0 // use 6.0 for production
    
    let video = "intro"
    @State var introPlayer = AVPlayer()

    
    var body: some View {
        ZStack {
            //            Text("Splash Screen")
            //                .onAppear {
            //                    withAnimation(.easeIn(duration: 1.5)) {
            //                        //                self.isActive
            //                    }
            //                }
            
            //            let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "IMG_0226", ofType: "mp4")!))
            
            Color(.black)
                .ignoresSafeArea(.all)
            
            //            VideoPlayer(player: AVPlayer(url:  Bundle.main.url(forResource: "intro", withExtension: "mp4")!))
            //                .frame(height: 400)
            VideoPlayer(player: introPlayer)
                .onAppear() {
                    introPlayer = AVPlayer(url: Bundle.main.url(forResource: "intro", withExtension: "mp4")!)
                    introPlayer.volume = 1.0
//                    introPlayer.show
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

