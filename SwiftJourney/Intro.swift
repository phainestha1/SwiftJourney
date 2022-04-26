//
//  Intro.swift
//  SwiftJourney
//
//  Created by Noah's Ark on 2022/04/21.
//

import SwiftUI

struct Intro: View {
    
    let storyLine: [String] = [
        "스위프트 마법의 유일한 계승자인 나는",
        "여행 중 한 마을에 도착한다.",
        "이 마을에서는 어쩌면",
        "내가 해야만 하는 일이 있을지도 모른다는",
        "그런 생각이 든다."
    ]
    
    @State var lineIndex: Int = 0
    
    var body: some View {
        NavigationView {
            VStack {
                Image("wizard")
                    .padding(.bottom)

                Text(storyLine[lineIndex])
                
                Spacer()
                    .frame(height: 50)
                
                HStack {
                    Button(action: {
                        lineIndex -= 1
                    }) {
                        Image(systemName: "arrowtriangle.backward.fill")
                    }
                    .disabled(lineIndex == 0 ? true : false)
                    
                    Spacer()
                        .frame(width: 30)
                    
                    Button(action: {
                        if lineIndex < storyLine.count-1 {
                            lineIndex += 1
                        } else {
                            lineIndex = 0
                        }
                    }) {
                        Image(systemName: "play.fill")
                    }
                    .disabled(lineIndex == storyLine.count-1 ? true : false)
                }
                
                Spacer()
                    .frame(height: 40)
                
                NavigationLink(destination: Map().navigationBarHidden(true)) {
                    Text("할 일 찾기")
                }
                .disabled(lineIndex == storyLine.count-1 ? false : true)
            }
        }
    }
}

struct Intro_Previews: PreviewProvider {
    static var previews: some View {
        Intro()
    }
}