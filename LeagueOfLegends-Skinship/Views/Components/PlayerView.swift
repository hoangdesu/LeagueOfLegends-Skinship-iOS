//
//  PlayerView.swift
//  LeagueOfLegends-Skinship
//
//  Created by ドロケ on 28/08/2022.
//

//import SwiftUI
//
//struct PlayerView: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}

// credit: https://schwiftyui.com/swiftui/playing-videos-on-a-loop-in-swiftui/

import SwiftUI
import AVKit
import AVFoundation

struct LoopingHomescreenVideoPlayerView: UIViewRepresentable {
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LoopingHomescreenVideoPlayerView>) {
    }

    func makeUIView(context: Context) -> UIView {
        return LoopingHomescreenVideoPlayerUIView(frame: .zero)
    }
}


class LoopingHomescreenVideoPlayerUIView: UIView {
    private let playerLayer = AVPlayerLayer()
    private var playerLooper: AVPlayerLooper?

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        // Load the resource
        let fileUrl = Bundle.main.url(forResource: "homescreen-background", withExtension: "mp4")!
        let asset = AVAsset(url: fileUrl)
        let item = AVPlayerItem(asset: asset)
        
        // Setup the player
        let player = AVQueuePlayer()
        playerLayer.player = player
        playerLayer.videoGravity = .resizeAspectFill
        layer.addSublayer(playerLayer)
         
        // Create a new player looper with the queue player and template item
        playerLooper = AVPlayerLooper(player: player, templateItem: item)

        // Start the movie
        player.play()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
}

//struct PlayerView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlayerView()
//    }
//}

