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
                    ZStack {
                        Image("messageBox")
                            .resizable()
                            .frame(width: 320, height: 100)
                        
                        Text(storyLine[lineIndex])
                            .padding()
                            .multilineTextAlignment(.center)
                            .font(.custom("DungGeunMo", size: 14))
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                        .frame(height: 50)
                    
                    HStack {
                        Button(action: {
                            lineIndex -= 1
                        }) {
                            lineIndex == 0
                            ? Image("arrowLeftDark")
                            : Image("arrowLeft")
                        }
                        .disabled(lineIndex == 0 ? true : false)

                        Spacer()
                            .frame(width: 80)
                        
                        Button(action: {
                            if lineIndex < storyLine.count-1 {
                                lineIndex += 1
                            } else {
                                lineIndex = 0
                            }
                        }) {
                            lineIndex == storyLine.count-1
                            ? Image("arrowRightDark")
                            : Image("arrowRight")
                        }
                        .disabled(lineIndex == storyLine.count-1 ? true : false)
                        .foregroundColor(lineIndex == storyLine.count-1 ? .gray : .white)
                    }
                    
                    Spacer()
                        .frame(height: 70)
                    
                    if lineIndex == storyLine.count-1 {
                        VStack {
                            NavigationLink(destination:
                                            MongmongSolution(mapIsActive: self.$mapIsActive)
                                            .navigationBarHidden(true))
                            {
                                ZStack {
                                    Image("buttonBackground")
                                    Text("도와준다")
                                        .foregroundColor(.red)
                                        .font(.custom("DungGeunMo", size: 14))
                                }
                            }
                            .isDetailLink(false)
                        }
                        
                        Button(action: {self.mapIsActive = false}) {
                            ZStack{
                                Image("buttonBackground")
                                
                                Text("돌아간다")
                                    .foregroundColor(.white)
                                    .font(.custom("DungGeunMo", size: 14))
                            }
                        }
                    }
                }
            }
        }
    }
}
