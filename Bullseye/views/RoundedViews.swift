//
//  RoundedViews.swift
//  Bullseye
//
//  Created by Anastasiia Solomka on 12.11.2023.
//

import SwiftUI

struct RoundedImageViewStroked: View {
    var systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("FontColor"))
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
            .overlay (
                Circle()
                    .strokeBorder(Color("ButtonStrokeColor"), lineWidth: Constants.General.strokeWidth)
            )
    }
}

struct RoundedImageViewFilled: View {
    var systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("ButtonFilledTextColor"))
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
            .background (
                Circle()
                    .fill(Color("ButtonFilledBackgroundColor"))
            )
    }
}

struct RoundRectTextView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
            .font(.title3)
            .kerning(-0.2)
            .frame(width: Constants.General.roundRectViewWidth, height: Constants.General.roundRectViewHeight)
            .foregroundColor(Color("FontColor"))
            .overlay (
                RoundedRectangle(cornerRadius: Constants.General.roundRectViewCornerRadius)
                    .stroke(lineWidth: Constants.General.strokeWidth)
                    .foregroundColor(Color("ButtonStrokeColor"))
                    
            )
    }
}

struct PreviewView: View {
    var body: some View {
        VStack(spacing: 20) {
            RoundedImageViewFilled(systemName: "arrow.counterclockwise")
            RoundedImageViewStroked(systemName: "list.dash")
            RoundRectTextView(text: "999")
        }
    }
}

#Preview("Default scheme") {
    PreviewView()
}

#Preview("Dark scheme") {
    PreviewView()
        .preferredColorScheme(.dark)
}
