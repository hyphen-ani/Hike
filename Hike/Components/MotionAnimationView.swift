//
//  MotionAnimationView.swift
//  Hike
//
//  Created by Hallucinate Labs on 23/06/24.
//

import SwiftUI

struct MotionAnimationView: View {
    
    // MARK: - Properties
    
    @State private var randomCircle: Int =  Int.random(in: 6...12)
    @State private var isAnimating: Bool = false
    
    // MARK: - Function
    // 1. Radom Coordinate
    
    func randomCoordinate() -> CGFloat {
        return CGFloat.random(in: 0...256)
    }
    
    // 2. Random Size
    
    func randomSize() -> CGFloat{
        return CGFloat.random(in: 4...80)
    }
    
    // 3. Random Scale
    
    func randomScale() -> CGFloat{
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    
    // 4. Random Speed
    
    func randomSpeed() -> Double{
        return Double.random(in: 0.05...1.0)
    }
    
    // 5. Random Delay
    
    func randomDelay() -> Double{
        return Double.random(in: 0...2)
    }
    
    var body: some View {
        ZStack{
            ForEach(0...randomCircle, id: \.self) { item in
                Circle()
                    .foregroundColor(.white)
                    .opacity(0.25)
                    .frame(width: randomSize())
                    .position(CGPoint(x: randomCoordinate(), y: randomCoordinate()))
                    .scaleEffect(isAnimating ? randomScale() : 1)
                    .onAppear(perform: {
                        withAnimation(
                            .interpolatingSpring(stiffness: 0.25, damping: 0.25)
                            .repeatForever()
                            .speed(randomSpeed())
                            .delay(randomDelay())
                        ) {
                            isAnimating.toggle()
                        }
                    })
            
            }
        }
        .frame(width: 256, height: 256)
        .mask(Circle())
        .drawingGroup()
    }
}

#Preview {
    ZStack{
        Color.teal.ignoresSafeArea()
        MotionAnimationView()
    }
}
