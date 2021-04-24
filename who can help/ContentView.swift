//
//  ContentView.swift
//  who can help
//
//  Created by 簡吟真 on 2021/4/24.
//  Jhen🐯

import SwiftUI

//
struct pic {
    var img: String
    var name: String
    var description: String
}

// 圖文
struct ContentView: View {
    
    let roles: [pic] = [
        pic(img: "哎", name: "嘆氣", description: "作業做不完"),
        pic(img: "哭", name: "崩潰", description: "不行～一定要寫完"),
        pic(img: "哪尼", name: "震驚", description: "下禮拜作業更多？"),
        pic(img: "壞了", name: "不是吧～", description: "只能不眠不休了")
    ]
    
    @State private var pickindex = 0
    
    //背景圖
    var body: some View {
        ZStack{
            
            Image("background")
                .resizable()
                .scaledToFill()
            
            //隨機
            HStack{
                Button(action:{
                    let randNum = 0 ..< self.roles.count
                    self.pickindex = randNum.randomElement()!
                }){
                    Text("🎲")
                        .font(.system(size: 65))
                        .fontWeight(.bold)
                        .padding()
                        .background(Color.orange)
                        .cornerRadius(50)
                        .shadow(radius: 50)
                }
                
                Picker(selection: $pickindex, label: Text("")) {
                    ForEach(0 ..< roles.count) { i in
                        Text(self.roles[i].name).tag(i)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .background(Color.gray)
                .border(Color.white)
                .cornerRadius(30)
                .shadow(radius: 30)
                .frame(width:300)
            }
            
            Image("\(roles[pickindex].img)")
                .resizable()
                .scaledToFit()
                .frame(width:350)
                .offset(x:-50,y:220)
            
            Text("\(roles[pickindex].description)")
                .offset(x:50,y:-100)
                .font(.system(size: 38))
                .foregroundColor(Color.white)
            
        }

        .edgesIgnoringSafeArea(.all)
    }
}
//預覽
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
