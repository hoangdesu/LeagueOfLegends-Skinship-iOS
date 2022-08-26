//
//  AudioPlayer.swift
//  LeagueOfLegends-Skinship
//
//  Created by ドロケ on 25/08/2022.
//

import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String, volume: Double) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.setVolume(Float(volume), fadeDuration: 0)
            audioPlayer?.play()
//            audiopla
        } catch {
            print("ERROR: Could not find and play the sound file!")
        }
    }
}
