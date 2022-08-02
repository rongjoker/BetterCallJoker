//
//  ContentView.swift
//  bestCallJoker
//
//  Created by 张士鹏 on 2022/7/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var alertIsVisible:Bool = false
    @State private var silderFlag = 50.0
    @State private var game:GameMe = GameMe()
    
    var body: some View {
        ZStack {
            BackgroundView(gameObj: $game)
            VStack {
                InstructionsView(gameObj: $game)
                    .padding(.bottom,alertIsVisible ? 0 :100)
                if alertIsVisible {
                    PointsView(gameObj: $game,alertIsVisible:$alertIsVisible,silderFlag: $silderFlag)
                        .transition(.scale)
                } else{
                    HitButtonView(alertIsVisible: $alertIsVisible,  silderFlag: $silderFlag, game: $game)
                }
                
            }
            if !alertIsVisible {
                SliderView(silderFlag: $silderFlag)
            }
            
        }
    }
}


struct InstructionsView:View{
    @Binding var gameObj:GameMe
    var body:some View{
        VStack{
        InstructionText(text: "🎯🎯🎯\nPut the Bullseye as close as you can to")            .padding(.leading,30.0)
            .padding(.trailing,30.0)
        BigText(text: String(gameObj.target))
        }
    }
}

struct SliderView:View{
    @Binding var silderFlag:Double
    var body:some View{
        HStack {
            SliderText(text: "1")
            Slider(value: $silderFlag,in: 1.0...100.0).foregroundColor(Color.red)
            SliderText(text: "100")
        }
    }
}

struct LabelText:View{
    var text: String
    var body:some View{
        Text(text).bold()
            .foregroundColor(Color("TextColor"))
            .kerning(1.5)
            .font(.caption)
    }
}

struct HitButtonView:View{
    @Binding var alertIsVisible:Bool
    @Binding var silderFlag:Double
    @Binding var game:GameMe
//    @State var msg:String = ""
//    @State var points:Int = 0
    var body:some View{
        Button(action: {
            withAnimation{
                alertIsVisible = true
            }
            
//            points = game.point(sliderValue: Int(silderFlag))
//            msg = "Your score is  \(points)"
        }){
            Text("hit me".uppercased()).bold().font(.title3)
            
        }.padding(20.0)
            .background(
                ZStack{
                Color("ButtonColor")
                LinearGradient(
                    gradient: Gradient(
                        colors: [Color.white.opacity(0.3),Color.clear]), startPoint: .top,
                        endPoint: .bottom
                    )
            })
            .foregroundColor(Color.white)
            .cornerRadius(21)
            .overlay(RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius).strokeBorder(Color.white,lineWidth: Constants.General.strokeWidth))
//            .alert("Congratulations", isPresented: $alertIsVisible){
//                Button("Next Round", action: {
//                  game.startNewRound(points: points)
//
//                })
//                Button("Cancel", role: .cancel, action: {})
//            } message: {
//                Text("\(msg)")
//            }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView().previewLayout(.fixed(width: 568, height: 320))
        ContentView()
            .preferredColorScheme(.dark)
        ContentView().preferredColorScheme(.dark).previewLayout(.fixed(width: 568, height: 320))
    }
}
