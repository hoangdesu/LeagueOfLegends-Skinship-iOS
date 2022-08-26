//
//  Extensions.swift
//  LeagueOfLegends-Skinship
//
//  Created by ドロケ on 27/08/2022.
//

import Foundation
import SwiftUI

extension Text {
    func scoreLabelStyle() -> Text {
        self
            .foregroundColor(Color.white)
            .font(.system(size: 10, weight: .bold, design: .rounded))
    }
    
    func scoreNumberStyle() -> Text {
        self
            .foregroundColor(Color.white)
            .font(.system(.title, design: .rounded))
            .fontWeight(.heavy)
    }
    
    func textLabelStyleWithFontSize(_ size: Double) -> Text {
        self
            .foregroundColor(Color.white)
            .font(.system(size: size, weight: .medium, design: .rounded))
    }
}
