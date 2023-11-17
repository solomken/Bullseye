//
//  ContentView.swift
//  Bullseye
//
//  Created by Anastasiia Solomka on 07.11.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var alertIsVisible = false
    @State private var sliderValue = 50.0
    @State private var game: Game = Game()
    
    var body: some View {
        ZStack {
            BackgroundView(game: $game)
            VStack {
                InstructionsView(game: $game)
                if alertIsVisible {
                    PointsView(sliderValue: $sliderValue, game: $game, alertIsVisible: $alertIsVisible)
                        .transition(.scale)
                } else {
                    HitMeButton(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
                    .padding(.top, 100)
                    .transition(.scale)
                }
            }
            if !alertIsVisible {
                SliderView(sliderValue: $sliderValue)
                    .zIndex(1.0)
                    .transition(.scale)
            }
        }
    }
}

struct InstructionsView: View {
    @Binding var game: Game
    
    var body: some View {
        InstructionText(text: "🎯🎯🎯\nPut the bullseye as close as you can to")
            .padding(.horizontal, 30)
        
        TargetText(text: String(game.target))
    }
}

struct SliderView: View {
    @Binding var sliderValue: Double
    
    var body: some View {
        HStack {
            SliderText(text: "1")
                .frame(width: 35)
            Slider(value: $sliderValue, in: 1.0...100.0)
                .accentColor(.red)
            SliderText(text: "100")
                .frame(width: 35)
        }
        .padding()
    }
}

struct HitMeButton: View {
    @Binding var alertIsVisible: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game
    
    var body: some View {
        Button("Hit me".uppercased()) {
            withAnimation {
                alertIsVisible = true
            }
        }
        .padding(20.0)
        .background(
            ZStack {
                Color("ButtonColor")
                LinearGradient(colors: [Color.white.opacity(0.3), Color.clear], startPoint: .top, endPoint: .bottom)
            }
        )
        .overlay (
            RoundedRectangle(cornerRadius: Constants.General.roundRectViewCornerRadius)
                .strokeBorder(Color.white, lineWidth: Constants.General.strokeWidth)
        )
        .foregroundStyle(.white)
        .cornerRadius(Constants.General.roundRectViewCornerRadius)
        .fontWeight(.bold)
        .font(.title3)
    }
}

#Preview("Default scheme") {
    ContentView()
}

#Preview("Dark scheme") {
    ContentView()
        .preferredColorScheme(.dark)
        .previewDevice("iPhone SE (3rd generation)")
}
