//
//  Game.swift
//  Bullseye
//
//  Created by Anastasiia Solomka on 08.11.2023.
//

import Foundation

struct Game {
    var target = Int.random(in: 1...100)
    var score = 0
    var round = 1
    var leaderboardEntries: [LeaderboardEntry] = []
    
    init(loadTestData: Bool = false) {
        if loadTestData {
            addToLeaderboard(score: 100)
            addToLeaderboard(score: 148)
            addToLeaderboard(score: 56)
            addToLeaderboard(score: 200)
            addToLeaderboard(score: 20)
            addToLeaderboard(score: 149)
        }
    }
    
    func points(sliderValue: Int) -> Int {
        let difference = abs(sliderValue - target)
        let bonusPoints: Int
        
        if difference == 0 {
            bonusPoints = 100
        } else if difference == 1 || difference == 2 {
            bonusPoints = 50
        } else {
            bonusPoints = 0
        }
        
        return 100 - difference + bonusPoints
    }
    
    mutating func startNewRound(points: Int) {
        addToLeaderboard(score: points)
        score += points
        round += 1
        target = Int.random(in: 1...100)
    }
    
    mutating func addToLeaderboard(score: Int) {
        leaderboardEntries.append(LeaderboardEntry(score: score, date: Date()))
        leaderboardEntries.sort { entry1, entry2 in
            entry1.score > entry2.score
        }
    }
    
    mutating func restart() {
        score = 0
        round = 1
        target = Int.random(in: 1...100)
    }
}

struct LeaderboardEntry {
    let score: Int
    let date: Date
}
