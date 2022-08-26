//
//  AnswerImageWrapper.swift
//  LeagueOfLegends-Skinship
//
//  Created by ドロケ on 25/08/2022.
//

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
