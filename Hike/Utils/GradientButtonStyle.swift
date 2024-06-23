//
//  GradientButtonStyle.swift
//  Hike
//
//  Created by Hallucinate Labs on 23/06/24.
//

import Foundation
import SwiftUI


struct GradientButton: ButtonStyle{
    
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
            .padding(.horizontal, 30)
            .background(
                
                // Conditional Statement
                
                // Condition ? a : b
                configuration.isPressed ?
                LinearGradient(colors: [.customGrayMedium, .customGrayMedium], startPoint: .top, endPoint: .bottom)
                :
                LinearGradient(colors: [.customGrayLight, .customGrayMedium], startPoint: .top, endPoint: .bottom)
            ).cornerRadius(40)
        
        
        
    }
    
    
}
