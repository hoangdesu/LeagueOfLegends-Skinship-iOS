//
//  AudioPlayer.swift
//  LeagueOfLegends-Skinship
//
//  Created by ドロケ on 25/08/2022.
//

/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2022B
 Assessment: Assignment 2
 Author: Hoang Nguyen
 ID: s3697305
 Last modified: 29/08/2022
 Acknowledgement: https://github.com/zydeico/SlotMachine
 */

import AVFoundation

var audioPlayer: AVAudioPlayer?
var backgroundMusicPlayer: AVAudioPlayer?
var announcerPlayer: AVAudioPlayer?
var audio2Player: AVAudioPlayer?

let goldSounds = ["gold1", "gold2", "gold3", "gold4", "gold5", "buy"]
let loseSounds = ["mia", "danger", "getback"]
let winAnnoucers = ["Rampage", "Dominating", "Godlike_1", "Killing Spree", "Legendary1_1"]

func playBackgroundMusic(music: String) {
    if let path = Bundle.main.path(forResource: music, ofType: "mp3") {
        do {
            backgroundMusicPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            backgroundMusicPlayer?.setVolume(0.69, fadeDuration: 0)
            backgroundMusicPlayer?.play()
        } catch {
            print("ERROR: Could not find background music file!")
        }
    }
}

func playSoundEffect(sound: String, type: String, volume: Float) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.setVolume(volume, fadeDuration: 0)
            audioPlayer?.play()
        } catch {
            print("ERROR: Could not find and play the sound file!")
        }
    }
}


func playAnnouncerSound(sound: String, type: String, volume: Float) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            announcerPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            announcerPlayer?.setVolume(volume, fadeDuration: 0)
            announcerPlayer?.play()
        } catch {
            print("ERROR: Could not find and play the sound file!")
        }
    }
}

func playSound2Effect(sound: String, type: String, volume: Float) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audio2Player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audio2Player?.setVolume(volume, fadeDuration: 0)
            audio2Player?.play()
        } catch {
            print("ERROR: Could not find and play the sound file!")
        }
    }
}
