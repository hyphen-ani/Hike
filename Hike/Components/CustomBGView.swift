//
//  CustomBGView.swift
//  Hike
//
//  Created by Hallucinate Labs on 23/06/24.
//

import SwiftUI

struct CustomBGView: View {
    var body: some View {
        ZStack {
            
            //MARK: -3. DEPTH
            
            Color.customGreenDark
                .cornerRadius(40)
                .offset(y:12)
            
            //MARK: -2. LIGHT
            
            Color.customGreenLight
                .cornerRadius(40)
                .offset(y:3)
                .opacity(0.85)
            
            //MARK: -1. SURFACE
            
            LinearGradient(colors: [Color.colorGreenLight, Color.colorGreenMedium], startPoint: .top, endPoint: .bottom).cornerRadius(40)
        }
    }
}

#Preview {
    CustomBGView()
        .padding()
}
