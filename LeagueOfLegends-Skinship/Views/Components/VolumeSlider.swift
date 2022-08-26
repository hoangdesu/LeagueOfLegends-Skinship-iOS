//
//  VolumeSlider.swift
//  LeagueOfLegends-Skinship
//
//  Created by ドロケ on 27/08/2022.
//

import SwiftUI
import MediaPlayer
import UIKit

//struct VolumeSlider: UIViewRepresentable {
//
//
//   func makeUIView(context: Context) -> MPVolumeView {
//      MPVolumeView(frame: .zero)
//   }
//
//   func updateUIView(_ view: MPVolumeView, context: Context) {}
//}

struct VolumeSlider: View {
    
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
//
//        }
        
//        Slider(value: $volume, in: range, step: step, label: <#T##() -> _#>, minimumValueLabel: <#T##() -> _#>, maximumValueLabel: <#T##() -> _#>, onEditingChanged: <#T##(Bool) -> Void#>)
    }
}
