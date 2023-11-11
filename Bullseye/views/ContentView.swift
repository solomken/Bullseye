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
            Color("BackgroundColor").ignoresSafeArea()
            VStack {
                Text("🎯🎯🎯\nPut the bullseye as close as you can to".uppercased())
                    .bold()
                    .multilineTextAlignment(.center)
                    .lineSpacing(4.0)
                    .font(.footnote)
                    .kerning(2)
                    .padding(.horizontal, 30)
                    .foregroundColor(Color("FontColor"))
                Text(String(game.target))
                    .fontWeight(.black)
                    .font(.largeTitle)
                    .kerning(-1.0)
                    .foregroundColor(Color("FontColor"))
                HStack {
                    Text("1")
                        .bold()
                        .foregroundColor(Color("FontColor"))
                    Slider(value: $sliderValue, in: 1.0...100.0)
                        .accentColor(.red)
                    Text("100")
                        .bold()
                        .foregroundColor(Color("FontColor"))
                }
                .padding()
                Button("Hit me".uppercased()) {
                    alertIsVisible = true
                }
                .padding(20.0)
                .background(
                    ZStack {
                        Color("ButtonColor")
                        LinearGradient(colors: [Color.white.opacity(0.3), Color.clear], startPoint: .top, endPoint: .bottom)
                    }
                )
                .foregroundStyle(.white)
                .cornerRadius(21.0)
                .fontWeight(.bold)
                .font(.title3)
                .alert(
                    "The sliders value is",
                    isPresented: $alertIsVisible,
                    actions: {
                        Button("Awesome") {
                            game.target = Int.random(in: 1...100)
                        }
                    },
                    message: {
                        let roundedValue = Int(sliderValue.rounded())
                        Text("""
                        \(roundedValue)
                    You scored \(game.points(sliderValue: roundedValue)) points.
                    """)
                    })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .preferredColorScheme(.dark)
            .previewDevice("iPhone SE (3rd generation)")
    }
}
