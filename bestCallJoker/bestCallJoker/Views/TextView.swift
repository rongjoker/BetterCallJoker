//
//  TextView.swift
//  bestCallJoker
//
//  Created by 张士鹏 on 2022/7/24.
//

import SwiftUI

struct InstructionText: View {
    var text:String
    var body: some View {
        Text(text.uppercased())
            .bold()
            .kerning(2.0)
            .opacity(0.8)
            .multilineTextAlignment(.center)
            .lineSpacing(5.0)
            .font(.footnote)
    }
}

struct BigText: View {
    var text:String
    var body: some View {
        Text(text)
            .kerning(-1.0)
            .font(.largeTitle)
            .fontWeight(.black)
            .foregroundColor(Color("TextColor"))
    }
}

struct SliderText: View {
    var text:String
    var body: some View {
        Text(text)
            .bold()
            .frame(width: 35.0)
    }
}

struct BodyText: View {
    var text:String
    var body: some View {
        Text(text)
            .bold()
            .foregroundColor(Color("TextColor"))
            .kerning(1.5)
            .font(.caption)
            .multilineTextAlignment(.center)
            .lineSpacing(12.0)
    }
}

struct ButtonText: View {
    var text:String
    var body: some View {
        Text(text)
            .bold()
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.accentColor)
            .foregroundColor(Color.white)
            .cornerRadius(12.0)
            
    }
}

struct ScoreText: View {
  var score: Int

  var body: some View {
    Text(String(score))
      .bold()
      .kerning(-0.2)
      .foregroundColor(Color("TextColor"))
      .font(.title3)
  }
}

struct DateText: View {
  var date: Date

  var body: some View {
    Text(date, style: .time)
      .bold()
      .kerning(-0.2)
      .foregroundColor(Color("TextColor"))
      .font(.title3)
  }
}

struct BigBoldText: View {
  let text: String

  var body: some View {
    Text(text.uppercased())
      .kerning(2.0)
      .foregroundColor(Color("TextColor"))
      .font(.title)
      .fontWeight(.black)
  }
}


struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            InstructionText(text:"The slider's value is ")
            BigText(text:"89")
            BodyText(text:"You scored 99 points ")
            ButtonText(text:"Start New Round")
            ScoreText(score:445)
            DateText(date: Date())
            BigBoldText(text: "LeaderBoard")
        }

    }
}
