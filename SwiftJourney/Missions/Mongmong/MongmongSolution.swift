//
//  MongmongSolution.swift
//  SwiftJourney
//
//  Created by Noah's Ark on 2022/04/21.
//

import SwiftUI

struct MongmongSolution: View {
    
    @Binding var mapIsActive: Bool
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("frame")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("방금 전 명령을 스위프트 마법을 통해 분석해보자.")
                        .font(.custom("DungGeunMo", size: 14))
                    Text("무엇이 문제였을까?")
                        .font(.custom("DungGeunMo", size: 14))
                    
                    Spacer()
                        .frame(height: 50)
                    
                    ZStack {
                        Image("messageBox")
                            .resizable()
                            .frame(width: 350, height: 180)
                        
                        VStack{
                            Text("let order: Int = '앉아!'\n\nfunc sitDown(order: String) -> String {\n  let name: String = '몽몽'\n  return name + order\n}")
                                .font(.custom("DungGeunMo", size: 15))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.leading)
                                .padding(.bottom, 10)
                        }
                    }
                    
                    VStack {
                        WrongAnswerButton(description: "sitDown 함수의 파라미터 타입을 Int로 바꿔야 해")
                        WrongAnswerButton(description: "sitDown 함수의 반환 타입을 Int로 바꿔야 해")
                        NavigationLink (
                            destination:
                                MongmongSolved(mapIsActive: self.$mapIsActive)
                                .navigationBarBackButtonHidden(true)
                        ) {
                            ZStack {
                                Image("buttonBackground")
                                    .resizable()
                                    .frame(width: 380, height: 50)
                                    .padding(.leading, 10)
                                
                                Text("order 변수의 타입을 String으로 바꿔야 해")
                                    .foregroundColor(.white)
                                    .font(.custom("DungGeunMo", size: 14))
                            }
                        }
                    }
                    .padding(.bottom, 20)
                    WrongAnswerButton(description: "return 되는 값을 order + name 순서로 바꿔야 해")
                    
                    Button(action: {self.mapIsActive = false}) {
                        Text("마을로 돌아간다")
                            .font(.custom("DungGeunMo", size: 14))
                            .foregroundColor(.white)
                    }
                    .padding(.top, 50)
                    
                }
                .padding(.bottom, 100)
            }
        }
    }
}

struct WrongAnswerButton: View {
    
    let description: String
    @State private var alertShow: Bool = false
    
    var body: some View {
        Button(action: {self.alertShow = true}) {
            ZStack {
                Image("buttonBackground")
                    .resizable()
                    .frame(width: 380, height: 50)
                    .padding(.leading, 10)
                
                
                Text(description)
                    .foregroundColor(.white)
                    .font(.custom("DungGeunMo", size: 14))
            }
        }
        .padding(.bottom, 20)
        .alert("이런..!", isPresented: $alertShow) {
            Button(action: {self.alertShow = false}) {
                Text("생각하기")
            }
        } message: {
            Text("다시 생각해볼까?")
        }
    }
}
