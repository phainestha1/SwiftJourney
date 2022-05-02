//
//  Mongmong.swift
//  SwiftJourney
//
//  Created by Noah's Ark on 2022/04/21.
//

import SwiftUI

struct MongmongIntro: View {
    
    @Binding var mapIsActive: Bool
    
    let storyLine: [String] = [
        "몽몽아 앉아!",
        "...",
        "앉아!",
        "앉아!!",
        "앉아!!!",
        "...",
        "큰일이야, 친구들한테 자랑해놨는데..",
        "?",
        "신기하게 생긴 사람이네?\n혹시 나 좀 도와줄 수 있어?",
    ]
    
    @State var lineIndex: Int = 0
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("frame")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    HStack{
                        Image("mongmong")
                        Image("boy")
                    }
                    Text(storyLine[lineIndex])
                        .padding()
                        .multilineTextAlignment(.center)
                    
                    HStack {
                        Button(action: {
                            lineIndex -= 1
                        }) {
                            Image(systemName: "arrowtriangle.backward.fill")
                        }
                        .disabled(lineIndex == 0 ? true : false)
                        .foregroundColor(lineIndex == 0 ? .gray : .white)
                        
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
                        .foregroundColor(lineIndex == storyLine.count-1 ? .gray : .white)
                    }
                    .padding()
                    
                    if lineIndex == storyLine.count-1 {
                        HStack {
                            Button(action: {self.mapIsActive = false}) {
                                Text("돌아간다")
                                    .foregroundColor(.white)
                            }
                            
                            Spacer()
                                .frame(width: 50)
                            
                            NavigationLink(destination:
                                            MongmongSolution(mapIsActive: self.$mapIsActive)
                                            .navigationBarHidden(true))
                            {
                                Text("도와준다")
                                    .foregroundColor(.white)
                            }
                            .isDetailLink(false)
                        }
                    }
                }
            }
        }
    }
}
