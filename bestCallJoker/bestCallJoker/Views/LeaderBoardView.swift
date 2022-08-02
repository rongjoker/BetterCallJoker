//
//  LeaderBoardView.swift
//  bestCallJoker
//
//  Created by 张士鹏 on 2022/7/31.
//

import SwiftUI

struct LeaderBoardView: View {
    @Binding var leaderboardIsShowing: Bool
    @Binding var game: GameMe
    
    
    var body: some View {
        ZStack {
            Color("BackgroundColor").edgesIgnoringSafeArea(.all)
            VStack(spacing: 10) {
                HeaderView(leaderboardIsShowing: $leaderboardIsShowing)
                LabelView()
                ScrollView {
                          VStack(spacing: 10) {
                            ForEach(game.leaderboardEntries.indices) { i in
                              let leaderboardEntry = game.leaderboardEntries[i]
                              RowView(index: i, score: leaderboardEntry.score, date: leaderboardEntry.date)
                            }
                          }
                        }
            }
            
        }
    }
}


struct RowView: View {
  let index: Int
  let score: Int
  let date: Date

  var body: some View {
    HStack {
      RoundedTextView(text: String(index))
      Spacer()
      ScoreText(score: score)
        .frame(width: Constants.LeaderBoard.leaderboardScoreColWidth)
      Spacer()
      DateText(date: date)
        .frame(width: Constants.LeaderBoard.leaderboardDateColWidth)
    }
    .background(
      RoundedRectangle(cornerRadius: .infinity)
        .strokeBorder(Color("LeaderboardRowColor"), lineWidth: Constants.General.strokeWidth)
    )
    .padding(.leading)
    .padding(.trailing)
    .frame(maxWidth: Constants.LeaderBoard.leaderboardMaxRowWidth)
  }
}


struct HeaderView:View{
    @Binding var leaderboardIsShowing: Bool
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View{
        ZStack {
            HStack{
                if verticalSizeClass == .regular && horizontalSizeClass == .compact {
                          BigBoldText(text: "Leaderboard")
                            .padding(.leading)
                          Spacer()
                        } else {
                          BigBoldText(text: "Leaderboard")
                        }
            }.padding(.top)
            
            HStack {
                Spacer()
                Button(action: {
                  leaderboardIsShowing = false
                }) {
                  RoundedImageViewFilled(systemName: "xmark")
                    .padding(.trailing)
            }
            }
}
        
    }
}

struct LabelView: View {
  var body: some View {
    HStack {
      Spacer()
        .frame(width: Constants.General.roundedViewLength)
      Spacer()
      LabelText(text: "Score")
        .frame(width: Constants.LeaderBoard.leaderboardScoreColWidth)
      Spacer()
      LabelText(text: "Date")
        .frame(width: Constants.LeaderBoard.leaderboardDateColWidth)
    }
    .padding(.leading)
    .padding(.trailing)
    .frame(maxWidth: Constants.LeaderBoard.leaderboardMaxRowWidth)
  }
}


struct LeaderBoardView_Previews: PreviewProvider {
    static private var game =  Binding.constant(GameMe())
    static private var leaderboardIsShowing = Binding.constant(false)
    static var previews: some View {
        LeaderBoardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
    }
}
