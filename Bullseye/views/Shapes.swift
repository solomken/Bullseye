//
//  Shapes.swift
//  Bullseye
//
//  Created by Anastasiia Solomka on 11.11.2023.
//

import SwiftUI

struct Shapes: View {
    var body: some View {
        VStack {
            Circle()
                //.fill(Color.blue)
                .inset(by: 10)
                .strokeBorder(Color.blue, lineWidth: 20)
                .frame(width: 200, height: 100)
                .background(Color.green)
            
            RoundedRectangle(cornerRadius: 20)
                .fill(.blue)
                .frame(width: 200, height: 100)
            
            Capsule()
                .fill(.blue)
                .frame(width: 200, height: 100)
            
            Ellipse()
                .fill(.blue)
                .frame(width: 200, height: 100)
        }
    }
}

#Preview {
    Shapes()
}
