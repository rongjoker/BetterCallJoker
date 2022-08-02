//
//  PointsView.swift
//  bestCallJoker
//
//  Created by 张士鹏 on 2022/7/31.
//

import SwiftUI

struct PointsView: View {
    @Binding var gameObj:GameMe
    @Binding var alertIsVisible:Bool
    @Binding var silderFlag:Double
    
    var body: some View {
        let roundedValue = Int(silderFlag.rounded())
        let points = gameObj.point(sliderValue: roundedValue)
        
        VStack( spacing: 10){
            InstructionText(text: "The Slider's value is ")
            BigText(text: String(roundedValue))
            BodyText(text:"You scored \(points) points ")
            Button(action: {
                withAnimation{
                    alertIsVisible.toggle()
                }
                gameObj.startNewRound(points: points)
            }){
                ButtonText(text: "Next Round")
            }
            
            
        }.padding()
            .frame(maxWidth: 300)
            .background(Color("BackgroundColor"))
            .cornerRadius(21.0)
            .shadow(radius: 10,x:5,y:5)
            .transition(.scale)
    }
}

struct PointsView_Previews: PreviewProvider {
    static private var alertIsVisible = Binding.constant(true)
    static private var silderFlag = Binding.constant(20.0)
    
    static var previews: some View {
        PointsView(gameObj: .constant(GameMe()),alertIsVisible: alertIsVisible,silderFlag: silderFlag)
        PointsView(gameObj: .constant(GameMe()),alertIsVisible: alertIsVisible,silderFlag: silderFlag).previewLayout(.fixed(width: 568, height: 320))
        PointsView(gameObj: .constant(GameMe()),alertIsVisible: alertIsVisible,silderFlag: silderFlag)
            .preferredColorScheme(.dark)
        PointsView(gameObj:.constant(GameMe()),alertIsVisible: alertIsVisible,silderFlag: silderFlag).preferredColorScheme(.dark).previewLayout(.fixed(width: 568, height: 320))
    }
}
