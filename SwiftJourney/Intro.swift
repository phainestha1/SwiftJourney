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
        "이 마을에서는",
        "내 도움이 필요한 사람이 있을지도!!",
    ]
    
    @State var lineIndex: Int = 0
    @Binding var backToMain: Bool
    @ObservedObject var newGameVerification = NewGameVerification()
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("frame")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Image("wizard")
                        .padding(.bottom)
                    
                    ZStack{
                        Image("messageBox")
                            .resizable()
                            .frame(width: 320, height: 100)
                        Text(storyLine[lineIndex])
                            .foregroundColor(.white)
                    }
                    
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
                    
                    NavigationLink(destination:
                                    Map(isNewGame: newGameVerification.isNewGame, backToMain: self.$backToMain)
                                    .navigationBarHidden(true)
                                    .navigationBarBackButtonHidden(true)
                                    .toolbar {
                        ToolbarItemGroup(placement: .navigationBarTrailing) {
                            Button(action: {
                                print("Hello user data saved successfully")
                            }) {
                                Text("저장하기")
                                
                            }
                        }
                    }
                    ) {
                        Text("할 일 찾기")
                    }
                    .disabled(lineIndex == storyLine.count-1 ? false : true)
                }
            }
        }
    }
}
