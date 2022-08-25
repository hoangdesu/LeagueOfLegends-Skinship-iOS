//
//  ContentView.swift
//  LeagueOfLegends-Skinship
//
//  Created by ドロケ on 25/08/2022.
//

import SwiftUI

struct ContentView: View {
    
    
    let haptics = UINotificationFeedbackGenerator()
    
    let tiles = ["Zed_0", "Ahri_0", "Yasuo_0", "Zoe_0", "Zyra_0"]
    let loadings = ["Zed_31", "Ezreal_25", "Draven_13", "Darius_8", "Caitlyn_29", "Ahri_5"]
    @State var i = 0
    @State var j = 0
    
    
    
    
    func test() {
        let fm = FileManager.default
        var path = Bundle.main.resourcePath!
        
        print(path)
        
        do {
            let items = try fm.contentsOfDirectory(atPath: path)
            
            for item in items {
                print("Found \(item)")
                
            }
        } catch {
            // failed to read directory – bad permissions, perhaps?
        }
    }
    
    
    
    
    func rollAnswer() {
        var choices = [tiles.randomElement(), tiles.randomElement(), tiles.randomElement(), tiles.randomElement()]
    }
    
    
    
    // MARK: - VIEW
    var body: some View {
        var choices = [tiles.randomElement(), tiles.randomElement(), tiles.randomElement(), tiles.randomElement()]
        
        ZStack {
            
            Image("SR")
                .ignoresSafeArea(.all)
                .opacity(0.9)
                .blur(radius: 4)
            
            
            
            VStack {
                
                Image(loadings[j])
                    .resizable()
                    .scaledToFit()
                    .frame(height: 400)
//                    .cornerRadius(6)
                    .padding()
                    
                
                VStack(spacing: 30) {
                    HStack {
                        Button {
                            
                            if self.i < tiles.count - 1 {
                                self.i += 1
                            } else {
                                self.i = 0
                            }
                            
                            rollAnswer()
                            haptics.notificationOccurred(.success)
                        } label: {
                            AnswerImageWrapper(image: choices[0]!)
                        }
                        
                        Spacer()
                            .frame(width: 50)
                        
                        Button {
                            
                            if self.j < loadings.count - 1 {
                                self.j += 1
                            } else {
                                self.j = 0
                            }
                            
                            haptics.notificationOccurred(.success)
                        } label: {
                            AnswerImageWrapper(image: choices[1]!)
                        }
                    }
                    
                    
                    HStack {
                        
                        Button {
                            haptics.notificationOccurred(.success)
                        } label: {
                            AnswerImageWrapper(image: choices[2]!)
                        }
                        
                        Spacer()
                            .frame(width: 50)
                        
                        Button {
                            rollAnswer()
                            haptics.notificationOccurred(.success)
                        } label: {
                            AnswerImageWrapper(image: choices[3]!)
                        }
                    }
                }
                
            }
        }
        
        
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
