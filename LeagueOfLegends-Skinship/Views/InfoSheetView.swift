//
//  InfoSheetView.swift
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
 Acknowledgement: https://github.com/zydeico/SlotMachine
 */

import SwiftUI

struct InfoSheetView: View {
    
    // MARK: - Principal Properties
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var champVM: ChampionViewModel
    
    let songs = ["SR - Early Game", "SR - Mid Game", "SR - Late Game", "Enemy", "PopStars"]
    @State var selectedSong = "SR - Early Game"
    
    @State private var showResetHighscoreAlert = false
    @State private var showHighscoreHasBeenResetAlert = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            CoverView()
            
            NavigationView {
                Form {
                    Section(header: Text("Settings")) {
                        Text("Background music volume: \(Int(self.champVM.backgroundMusicVolume / 1.0 * 100))")
                        VolumeSlider(champVM: self.champVM)
                        
                        Picker("Music", selection: $selectedSong) {
                            ForEach(songs, id: \.self) {
                                Text($0)
                            }
                        }
                        
                        Button(action: {
                            self.champVM.backgroundMusic = self.selectedSong
                            playBackgroundMusic(music: selectedSong)
                        }, label: {
                            Text("Change music")
                        })
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                        
                        Button(action: {
                            self.showResetHighscoreAlert = true
                        }, label: {
                            Text("Reset high score")
                                .foregroundColor(.red)
                        })
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                    }
                    
                    Section(header: Text("About this game")) {
                        FormRowView(firstItem: "App name", secondItem: "League of Legends: Skinship")
                        FormRowView(firstItem: "iOS version", secondItem: "15.5")
                        FormRowView(firstItem: "macOS version", secondItem: "12.2")
                        FormRowView(firstItem: "LoL version", secondItem: "12.16.1")
                        FormRowView(firstItem: "Developer", secondItem: "Hoang Nguyen")
                            .onTapGesture {
                                if let url = URL(string: "https://www.facebook.com/Hoangdayo") {
                                    UIApplication.shared.open(url)
                                }
                            }
                        FormRowView(firstItem: "Github repo", secondItem: "@hoangdesu")
                            .onTapGesture {
                                if let url = URL(string: "https://github.com/hoangdesu/LeagueOfLegends-Skinship-iOS") {
                                    UIApplication.shared.open(url)
                                }
                            }
                        FormRowView(firstItem: "Website", secondItem: "hoangdesu.com")
                            .onTapGesture {
                                if let url = URL(string: "https://hoangdesu.com") {
                                    UIApplication.shared.open(url)
                                }
                            }
                        FormRowView(firstItem: "Assets by", secondItem: "Riot Games")
                        FormRowView(firstItem: "Version", secondItem: "1.0.0")
                    }
                }
                .font(.system(.body, design: .rounded))
            }}
        .padding(.top, 40)
        .overlay(
            Button(action: {
                // Closing view
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "xmark.circle")
                    .foregroundColor(.white)
                    .font(.title)
            }
                .padding(.top, 30)
                .padding(.trailing, 20)
                .accentColor(Color.secondary), alignment: .topTrailing
        )
        .alert("Warning!", isPresented: $showResetHighscoreAlert, actions: {
            Button("Reset", role: .destructive) {
                self.champVM.highscore = 0
                self.champVM.topPlayer = ""
                self.showHighscoreHasBeenResetAlert = true
                self.champVM.resetGameState()
            }
        }, message: {
            Text("Do you want to reset high score?")
        })
        .alert("Highscore has been reset!", isPresented: $showHighscoreHasBeenResetAlert) {
            Button("OK", role: .cancel) { }
        }
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
