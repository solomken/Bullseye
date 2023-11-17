//
//  PointsView.swift
//  Bullseye
//
//  Created by Anastasiia Solomka on 15.11.2023.
//

import SwiftUI

struct PointsView: View {
    @Binding var sliderValue: Double
    @Binding var game: Game
    @Binding var alertIsVisible: Bool
    
    var body: some View {
        let roundedValue = Int(sliderValue.rounded())
        let points = game.points(sliderValue: roundedValue)
        
        VStack(spacing: 10) {
            InstructionText(text: "THE SLIDERS VALUE IS")
            TargetText(text: String(roundedValue))
            BodyText(title: "You scored \(points) points\n🎉🎉🎉")
            Button {
                withAnimation {
                    alertIsVisible = false
                }
                game.startNewRound(points: points)
            } label: {
                ButtonText(title: "Start New Round")
            }
        }
            .padding()
            .frame(maxWidth: 300)
            .background(Color("BackgroundColor"))
            .cornerRadius(Constants.General.roundRectViewCornerRadius)
            .shadow(radius: 10, x: 5, y: 5)
    }
}

#Preview {
    PointsView(sliderValue: .constant(50), game: .constant(Game()), alertIsVisible: .constant(false))
}

#Preview("Landscape") {
    PointsView(sliderValue: .constant(50), game: .constant(Game()), alertIsVisible: .constant(false))
        .preferredColorScheme(.dark)
        .previewInterfaceOrientation(.landscapeRight)
}
