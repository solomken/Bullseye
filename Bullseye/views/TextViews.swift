//
//  TextViews.swift
//  Bullseye
//
//  Created by Anastasiia Solomka on 12.11.2023.
//

import SwiftUI

struct InstructionText: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .bold()
            .multilineTextAlignment(.center)
            .lineSpacing(4.0)
            .font(.footnote)
            .kerning(2)
            .foregroundColor(Color("FontColor"))
    }
}

struct TargetText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .fontWeight(.black)
            .font(.largeTitle)
            .kerning(-1.0)
            .foregroundColor(Color("FontColor"))
    }
}

struct SliderText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
            .foregroundColor(Color("FontColor"))
    }
}

struct LabelText: View {
    var title: String
    
    var body: some View {
        Text(title.uppercased())
            .bold()
            .multilineTextAlignment(.center)
            .lineSpacing(4.0)
            .font(.caption)
            .kerning(1.5)
            .foregroundColor(Color("FontColor"))
    }
}

struct BodyText: View {
    var title: String
    
    var body: some View {
        Text(title)
            .multilineTextAlignment(.center)
            .font(.subheadline)
            .fontWeight(.semibold)
            .lineSpacing(12.0)
            .padding(10)
    }
}

struct ButtonText: View {
    var title: String
    
    var body: some View {
        Text(title)
            .padding()
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .fontWeight(.bold)
            .background (
                Color.accentColor
            )
            .cornerRadius(12)
    }
}

struct ScoreText: View {
    var score: Int
    
    var body: some View {
        Text(String(score))
            .bold()
            .font(.title3)
            .kerning(-0.2)
            .foregroundColor(Color("FontColor"))
    }
}

struct DateText: View {
    var date: Date
    
    var body: some View {
        Text(date, style: .time)
            .bold()
            .font(.title3)
            .kerning(-0.2)
            .foregroundColor(Color("FontColor"))
    }
}

struct HeaderText: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .foregroundStyle(Color("FontColor"))
            .fontWeight(.black)
            .kerning(2.0)
            .font(.title)
    }
}

#Preview {
    VStack {
        InstructionText(text: "Instructions")
        TargetText(text: "88")
        SliderText(text: "1111")
        LabelText(title: "score")
        BodyText(title: "You scored 200 Points\n🎉🎉🎉")
        ButtonText(title: "Start New Round")
        ScoreText(score: 149)
        DateText(date: Date())
        HeaderText(text: "Leaderboard")
    }
    .padding()
}

#Preview("Dark") {
    VStack {
        InstructionText(text: "Instructions")
        TargetText(text: "88")
        SliderText(text: "1111")
        LabelText(title: "score")
        BodyText(title: "You scored 200 Points\n🎉🎉🎉")
        ButtonText(title: "Start New Round")
        ScoreText(score: 149)
        DateText(date: Date())
        HeaderText(text: "Leaderboard")
    }
    .padding()
    .preferredColorScheme(.dark)
}
