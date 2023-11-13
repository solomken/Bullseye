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
    
    mutating func points(sliderValue: Int) -> Int {
        let difference = abs(sliderValue - target)
        let bonusPoints: Int
        
        if difference == 0 {
            bonusPoints = 100
        } else if difference <= 2 {
            bonusPoints = 50
        } else {
            bonusPoints = 0
        }
        
        return 100 - difference + bonusPoints
    }
    
    mutating func startNewRound(points: Int) {
        score += points
        round += 1
        target = Int.random(in: 1...100)
    }
}
