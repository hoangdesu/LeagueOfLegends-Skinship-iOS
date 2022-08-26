//
//  CoverView.swift
//  LeagueOfLegends-Skinship
//
//  Created by ドロケ on 27/08/2022.
//

import SwiftUI

struct CoverView: View {
    
    var body: some View {
        Image("cover")
            .resizable()
            .scaledToFit()
            .frame(maxWidth: .infinity, alignment: .center)
            .layoutPriority(1)
            .modifier(ShadowModifier())
            .ignoresSafeArea()
            .offset(y: -50)
            .padding(.bottom, -50)
    }
}

struct CoverView_Previews: PreviewProvider {
    static var previews: some View {
        CoverView()
    }
}
