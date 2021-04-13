//
//  ContentView.swift
//  who can help
//
//  Created by 簡吟真 on 2021/4/13.
//

import SwiftUI

struct pic {
    var img: String
    var name: String
    var speak:String
}

struct ContentView: View {
    
    let roles: [pic] = [
        pic(img: "5zarco", name: "十塊", speak: "杜家直線最速"),
        pic(img: "12Viñales", name: "小牛", speak: "終於抽到車了"),
        pic(img: "42rins", name: "Rins", speak: "冠軍不是我🥲"),
        pic(img: "46rossi", name: "老闆", speak: "林北的抓地力？"),
        pic(img: "93marquez", name: "marquez", speak: "冠軍我來了～")
    ]
    
    @State private var pickhou = 0
    
    var body: some View {
            ZStack {
                ZStack{
                Rectangle()
                    .foregroundColor(.black)
                Text("WHO can help ⁉️")
                    .foregroundColor(.pink)
                    .offset(x:-60, y:-300)
                    .font(.largeTitle)
                Group {
                    Path(roundedRect: CGRect(x:0,y:90,width:200, height:100),cornerRadius: 20)
                        .foregroundColor(.white)
                        .rotation3DEffect(Angle(degrees: 40), axis: (x: 200.0, y: 0.0, z: 110.0))
                        .offset(x:-50)
                    Path{ (path) in
                        path.move(to: CGPoint(x:90,y:180))
                        path.addLine(to: CGPoint(x:90,y:224))
                    }
                    .stroke(Color(.black))
                }
                Text("MotoGP 鹿死誰手")
                .foregroundColor(.blue)
                .font(.largeTitle)
                    .offset(y:-30)
            }
            ZStack{
                Rectangle()
                    .frame(height:400)
                    .offset(y:209)
                    .foregroundColor(.white)
                
                Group {
                    Path(roundedRect: CGRect(x:330,y:230,width:200, height:100),cornerRadius: 20)
                        .foregroundColor(.blue)
                        .rotationEffect(Angle(degrees: 90))
                        .rotation3DEffect(Angle(degrees: -50), axis: (x: 10.0, y: 80.0, z: 0.0))
                        .offset()
                    Path{ (path) in
                        path.move(to: CGPoint(x:290,y:740))
                        path.addLine(to: CGPoint(x:355,y:700))
                        }
                    .stroke(Color(.white))
                }
                
                Picker(selection: $pickhou, label: Text("")) {
                    ForEach(0 ..< roles.count) { i in
                        Text(self.roles[i].name).tag(i)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .background(Color.gray)
                .border(Color.white)
                .cornerRadius(30)
                .shadow(radius: 20)
                .frame(width:420)
                .offset(y:45)
                
                Image("\(roles[pickhou].img)")
                    .resizable()
                    .scaledToFit()
                    .frame(width:200)
                    .offset(x:-50,y:230)
            
                Text("\(roles[pickhou].speak)")
                    .offset(x:55,y:100)
                    .font(.system(size: 38))
                    .foregroundColor(Color.red)
                
                
      }
   }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}
