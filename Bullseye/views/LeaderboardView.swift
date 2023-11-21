//
//  RowView.swift
//  Bullseye
//
//  Created by Anastasiia Solomka on 17.11.2023.
//

import SwiftUI

struct LeaderboardView: View {
    @Binding var leaderBoardIsShowing: Bool
    @Binding var game: Game
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            VStack(spacing: 10) {
                HeaderView(leaderBoardIsShowing: $leaderBoardIsShowing)
                LabelView()
                ScrollView {
                    VStack(spacing: 10) {
                        ForEach(game.leaderboardEntries.indices, id: \.self) { index in
                            let leaderboardEntry = game.leaderboardEntries[index]
                            RowView(index: index + 1, score: leaderboardEntry.score, date: leaderboardEntry.date)
                        }
                    }
                }
            }
        }
    }
}

struct HeaderView: View {
    @Environment (\.verticalSizeClass) var verticalSizeClass
    @Environment (\.horizontalSizeClass) var horizontalSizeClass
    @Binding var leaderBoardIsShowing: Bool
    
    var body: some View {
        ZStack {
            HStack {
                HeaderText(text: "Leaderboard")
                if verticalSizeClass == .regular && horizontalSizeClass == .compact {
                    Spacer()
                }
            }
            HStack {
                Spacer()
                Button {
                    leaderBoardIsShowing = false
                } label: {
                    RoundedImageViewFilled(systemName: "xmark")
                }
            }
        }
        .padding([.horizontal, .top])
        .frame(maxWidth: Constants.Leaderboard.maxRowWidth)
    }
}

struct LabelView: View {
    var body: some View {
        HStack {
            Spacer()
                .frame(width: Constants.General.roundedViewLength)
            Spacer()
            LabelText(title: "Score")
                .frame(width: Constants.Leaderboard.scoreColumnWidth)
            Spacer()
            LabelText(title: "Date")
                .frame(width: Constants.Leaderboard.dateColumnWidth)
        }
        .padding(.horizontal)
        .frame(maxWidth: Constants.Leaderboard.maxRowWidth)
    }
}

struct RowView: View {
    let index: Int
    let score: Int
    let date: Date
    
    
    var body: some View {
        HStack {
            RoundCircleTextView(index: index)
            Spacer()
            ScoreText(score: score)
                .frame(width: Constants.Leaderboard.scoreColumnWidth)
            Spacer()
            DateText(date: date)
                .frame(width: Constants.Leaderboard.dateColumnWidth)
        }
        .background (
            RoundedRectangle(cornerRadius: .infinity)
                .strokeBorder(Color("LeaderBoardRowColor"))
        )
        .padding(.horizontal)
        .frame(maxWidth: Constants.Leaderboard.maxRowWidth)
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static private var leaderboardIsShowing = Binding.constant(false)
    static private var game = Binding.constant(Game(loadTestData: true))
    
    static var previews: some View {
        LeaderboardView(leaderBoardIsShowing: leaderboardIsShowing, game: game)
        LeaderboardView(leaderBoardIsShowing: .constant(false), game: game)
            .preferredColorScheme(.dark)
            .previewInterfaceOrientation(.landscapeRight)
    }

}
