//
//  BackgroundView.swift
//  bestCallJoker
//
//  Created by 张士鹏 on 2022/7/24.
//

import SwiftUI

struct BackgroundView: View {
    @Binding var gameObj:GameMe
    
    var body: some View {
        VStack{
            TopView(gameObj: $gameObj)
            Spacer()
            BottomView(gameObj: $gameObj)
        }.padding()
            .background(
                RingView()
            )
    }
}

struct TopView: View {
  @Binding var gameObj: GameMe
  @State private var leaderboardIsShowing = false

  var body: some View {
    HStack {
      Button(action: {
          gameObj.restart()
      }) {
        RoundedImageViewStroked(systemName: "arrow.counterclockwise")
      }
      Spacer()
      Button(action: {
        leaderboardIsShowing = true
      }) {
        RoundedImageViewFilled(systemName: "list.dash")
      }.sheet(isPresented: $leaderboardIsShowing, onDismiss: {}, content: {
          LeaderBoardView(leaderboardIsShowing: $leaderboardIsShowing, game: $gameObj)
      })
    }
  }
}

struct NumberView: View {
    var title: String
    var text: String
    
    var body: some View {
        Text(title).padding()
        LabelText(text: text)
        
    }
}


struct BottomView: View {
    @Binding var gameObj:GameMe
    
    var body: some View {
        HStack{
            NumberView(title: "Score", text: String(gameObj.score))
            Spacer()
            NumberView(title: "Round", text: String(gameObj.round))
        }
    }
}

struct RingView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack{
            Color("BackgroundColor")
              .edgesIgnoringSafeArea(.all)
            ForEach(1..<6){
                ring in
                let size = CGFloat(100 * ring)
                let opacity = colorScheme == .dark ? 0.1 : 0.3
                Circle().stroke(lineWidth: 20.0)
                    .fill(
                                RadialGradient(gradient: Gradient(colors: [Color("RingsColor").opacity(opacity), Color("RingsColor").opacity(0)]), center: .center, startRadius: 100, endRadius: 300)
                              )
                    .frame(width: size, height: size)
            }
            
        }
    }
}


struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(gameObj:.constant(GameMe()))
    }
}
