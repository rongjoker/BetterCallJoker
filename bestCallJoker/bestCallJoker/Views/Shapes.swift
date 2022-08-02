//
//  shapes.swift
//  bestCallJoker
//
//  Created by 张士鹏 on 2022/7/24.
//

import SwiftUI

struct shapes: View {
    @State private var wideShapes = true
    
    
    var body: some View {
        VStack{
            
            if !wideShapes {
                Circle()
    //                .fill(Color.blue)
                    .strokeBorder(Color.blue,lineWidth: 20.0)
    //                .inset(by: 10.0)
    //                .stroke(Color.blue,lineWidth: 20.0)
                    .frame(width: 200.0, height: 100.0)
                    .transition(.slide)
                }
                
            RoundedRectangle(cornerRadius: 20.0)
//                .fill(Color.blue)
                .strokeBorder(Color.blue,lineWidth: 20.0)
//                .inset(by: 10.0)
//                .stroke(Color.blue,lineWidth: 20.0)
                .frame(width: 200.0, height: 100.0)
           
            
            Capsule()
//                .fill(Color.blue)
                .strokeBorder(Color.blue,lineWidth: 20.0)
//                .inset(by: 10.0)
//                .stroke(Color.blue,lineWidth: 20.0)
                .frame(width: 200.0, height: 100.0)
            
            Ellipse()
//                .fill(Color.blue)
                .strokeBorder(Color.blue,lineWidth: 20.0)
//                .inset(by: 10.0)
//                .stroke(Color.blue,lineWidth: 20.0)
                .frame(width: 200.0, height: 100.0)
            
            Button(action: {
                withAnimation{wideShapes.toggle()}
            }){
                Text("test animate")
                
            }
            
        }
        .background(Color.green)
    }
}

struct shapes_Previews: PreviewProvider {
    static var previews: some View {
        shapes()
    }
}
