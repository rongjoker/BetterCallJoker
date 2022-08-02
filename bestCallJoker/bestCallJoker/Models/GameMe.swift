//
//  GameMe.swift
//  bestCallJoker
//
//  Created by 张士鹏 on 2022/7/24.
//

import Foundation

struct LeaderboardEntry {
  let score: Int
  let date: Date
}

struct GameMe{
    var target: Int = Int.random(in: 1..<100)
    var score: Int = 0
    var round: Int = 1
    var leaderboardEntries: [LeaderboardEntry] = [LeaderboardEntry(score: 10, date: Date())]
    
    
    mutating func point(sliderValue: Int)->Int{
        100 - abs(sliderValue - target)

    }
    
    mutating func addToLeaderboard(point: Int) {
        leaderboardEntries.append(LeaderboardEntry(score: point, date: Date()))
        leaderboardEntries.sort { $0.score > $1.score }
      }
    
    
    mutating func startNewRound(points: Int){
        self.target = Int.random(in: 1..<100)
        self.score += points
        self.round += 1
        addToLeaderboard(point: points)
    }
    
    mutating func restart() {
       score = 0
       round = 1
       target = Int.random(in: 1...100)
     }
    
    
}
