//
//  PlayerView.swift
//  LeagueOfLegends-Skinship
//
//  Created by ドロケ on 28/08/2022.
//

/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2022B
 Assessment: Assignment 2
 Author: Hoang Nguyen
 ID: s3697305
 Last modified: 29/08/2022
 Acknowledgement: https://schwiftyui.com/swiftui/playing-videos-on-a-loop-in-swiftui/
 */

import SwiftUI
import AVKit
import AVFoundation

let homeBackgroundPlayer = AVQueuePlayer()

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
        
        playerLayer.player = homeBackgroundPlayer
        playerLayer.videoGravity = .resizeAspectFill
        layer.addSublayer(playerLayer)
         
        // Create a new player looper with the queue player and template item
        playerLooper = AVPlayerLooper(player: homeBackgroundPlayer, templateItem: item)

        // Start the movie
        homeBackgroundPlayer.play()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
}
