//
//  AudioPlayer.swift
//  LeagueOfLegends-Skinship
//
//  Created by ドロケ on 25/08/2022.
//

import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
//            print("PATH \(path)")
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("ERROR: Could not find and play the sound file!")
        }
    }
}

let sounds = [
    "mia": URL(fileURLWithPath: Bundle.main.path(forResource: "mia", ofType: "wav")!)
]

func playSoundEffect(_ sound: String) {
    do {
        audioPlayer = try AVAudioPlayer(contentsOf: sounds[sound]!)
        audioPlayer?.play()
    } catch {
        print("Error")
    }
}
