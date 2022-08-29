//
//  VolumeSlider.swift
//  LeagueOfLegends-Skinship
//
//  Created by ドロケ on 27/08/2022.
//

/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2022B
 Assessment: Assignment 2
 Author: Hoang Nguyen
 ID: s3697305
 Last modified: 29/08/2022
 */

import SwiftUI
import MediaPlayer
import UIKit

struct VolumeSliderWithIdicators: View {
    
    @State private var volume: Double = 0
    @State private var hasChanged: Bool = false
    
    private let range: ClosedRange<Double> = 0...100
    private let step: Double = 1
    
    var body: some View {
        
        Text("Current volume \(self.volume)")
        
        Slider(value: $volume, in: range, step: step) {
        } minimumValueLabel: {
            Text("\(range.lowerBound)")
        } maximumValueLabel: {
            Text("\(range.upperBound)")
        } onEditingChanged: { hasChanged in
            self.hasChanged = hasChanged
        }
    }
}

struct VolumeSlider: View {
    
    @ObservedObject var champVM: ChampionViewModel
    
    @State private var volume: Double = 0
    @State private var hasChanged: Bool = false
    
    private let range: ClosedRange<Double> = 0...1.0
    private let step: Double = 0.01
    
    var body: some View {
        
        Slider(value: $champVM.backgroundMusicVolume, in: range, step: step) {
        } onEditingChanged: { hasChanged in
            self.hasChanged = hasChanged
            backgroundMusicPlayer?.setVolume(Float(self.champVM.backgroundMusicVolume), fadeDuration: 0)
        }
    }
}
