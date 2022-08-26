//
//  AudioPlayer.swift
//  LeagueOfLegends-Skinship
//
//  Created by ドロケ on 25/08/2022.
//

import AVFoundation

var audioPlayer: AVAudioPlayer?
var backgroundMusicPlayer: AVAudioPlayer?

func playBackgroundMusic() {
    if let path = Bundle.main.path(forResource: "summonersRift", ofType: "mp3") {
        do {
            backgroundMusicPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            backgroundMusicPlayer?.setVolume(0.5, fadeDuration: 0)
            backgroundMusicPlayer?.play()
        } catch {
            print("ERROR: Could not find background music file!")
        }
    }
}

func playSoundEffect(sound: String, type: String, volume: Double) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.setVolume(Float(volume), fadeDuration: 0)
            audioPlayer?.play()
        } catch {
            print("ERROR: Could not find and play the sound file!")
        }
    }
}
