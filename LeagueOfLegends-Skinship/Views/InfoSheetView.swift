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
    
    let songs = ["SR - Early Game", "SR - Mid Game", "SR - Late Game", "Enemy", "PopStars"]
    @State var selectedSong = "SR - Early Game"
    
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
                    }
                    Section(header: Text("About this game")) {
                        FormRowView(firstItem: "App name", secondItem: "League of Legends: Skinship")
                        FormRowView(firstItem: "iOS version", secondItem: "15.5")
                        FormRowView(firstItem: "Developer", secondItem: "Hoang Nguyen")
                        FormRowView(firstItem: "Website", secondItem: "hoangdesu.com")
                            .onTapGesture {
                                if let url = URL(string: "https://www.hoangdesu.com") {
                                    UIApplication.shared.open(url)
                                }
                            }
                        FormRowView(firstItem: "CopyRight", secondItem: "2022 all rigths reserved")
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
