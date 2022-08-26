//
//  InfoSheetView.swift
//  LeagueOfLegends-Skinship
//
//  Created by ドロケ on 27/08/2022.
//

import SwiftUI

struct InfoSheetView: View {
    
    // MARK: - Principal Properties
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var champVM: ChampionViewModel
    @State private var selectedStrength = "Mild"
        let strengths = ["Mild", "Medium", "Mature"]
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            CoverView()
            NavigationView {
                
                Form {
                    Section(header: Text("Settings")) {
                        Text("Background music volume: \(Int(self.champVM.backgroundMusicVolume / 1.0 * 100))")
                        VolumeSlider(champVM: self.champVM)
                        Picker("Music", selection: $selectedStrength) {
                            ForEach(strengths, id: \.self) {
                                Text($0)
                                    .onTapGesture {
                                        backgroundMusicPlayer?.play()
                                    }
                                    
//                                Text("Hello, World!")
//                                    .onLongPressGesture {
//                                        print("Long pressed!")
//                                    }
                                
                            }
                        }
                        
                        Picker("Strength", selection: $selectedStrength) {
                                                ForEach(strengths, id: \.self) {
                                                    Text($0)
                                                        .onTapGesture {
                                                            backgroundMusicPlayer?.stop()
                                                        }
                                                        
                                                }
                                            }
                        
                    }
                    Section(header: Text("About this game")) {
                        FormRowView(firstItem: "App name", secondItem: "League of Legends: Skinship")
                        FormRowView(firstItem: "iOS version", secondItem: "15.5")
                        FormRowView(firstItem: "Developer", secondItem: "Hoang Nguyen")
                        FormRowView(firstItem: "Website", secondItem: "hoangdesu.com")
                        FormRowView(firstItem: "CopyRight", secondItem: "2022 all rigths reserved")
                        FormRowView(firstItem: "Version", secondItem: "1.0.0")
                    }
                    //
                    //                Section(header: Text("About the Application")) {
                    //                    FormRowView(firstItem: "Application", secondItem: "Slot Machine")
                    //                    FormRowView(firstItem: "Platforms", secondItem: "iPhone, iPad, Mac")
                    //                    FormRowView(firstItem: "Developer", secondItem: "Daniel Vázquez")
                    //                    FormRowView(firstItem: "UI Designer", secondItem: "Robert Petras")
                    //                    FormRowView(firstItem: "Music", secondItem: "Dan Lebowitz")
                    //                    FormRowView(firstItem: "Website", secondItem: "danvz.codes")
                    //                    FormRowView(firstItem: "CopyRight", secondItem: "2020 all rigths reserved")
                    //                    FormRowView(firstItem: "Version", secondItem: "1.0.0")
                    //                }
                }
                .font(.system(.body, design: .rounded))
            }}
        .padding(.top, 40)
        .overlay(
            Button(action: {
                audioPlayer?.stop()
                // Closing view
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "xmark.circle")
                    .font(.title)
            }
                .padding(.top, 30)
                .padding(.trailing, 20)
                .accentColor(Color.secondary), alignment: .topTrailing
        )
        .onAppear(perform: {
            //            playSound(sound: "background-music", type: "mp3")
            //            playSound(sound: "summonersRift", type: "mp3", volume: self.champVM.backgroundMusicVolume)
        })
    }
}

struct FormRowView: View {
    
    // MARK: - Properties struct
    var firstItem: String
    var secondItem: String
    
    var body: some View {
        HStack {
            Text(firstItem)
                .foregroundColor(Color.gray)
            Spacer()
            Text(secondItem)
        }
    }
}
