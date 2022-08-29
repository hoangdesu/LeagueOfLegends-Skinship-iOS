//
//  AnswerImageWrapper.swift
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
 */

import SwiftUI

struct AnswerImageWrapper: View {
    var image: String
    
    var body: some View {
        
        Image(image)
            .resizable()
            .scaledToFit()
            .frame(width: 100)
            .cornerRadius(12)
    }
}

struct AnswerImageWrapper_Previews: PreviewProvider {
    static var previews: some View {
        AnswerImageWrapper(image: "Zed_0")
    }
}
