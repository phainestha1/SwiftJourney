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
                    Text("무엇이 문제였을까?")
                    
                    Spacer()
                        .frame(height: 50)
                    
                    ZStack {
                        VStack{
                            Text("let order: Int = '앉아!'")
                                .frame(width: 300, alignment: .leading)
                                .padding(.bottom, 10)
                            Text("func sitDown(order: String) -> String {")
                                .frame(width: 300, alignment: .leading)
                            Text("let name: String = '몽몽'")
                                .frame(width: 300, alignment: .leading)
                                .padding(.leading, 40)
                            Text("return name + order")
                                .frame(width: 300, alignment: .leading)
                                .padding(.leading, 40)
                            Text("}")
                                .frame(width: 300, alignment: .leading)
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
                            Text("order 변수의 타입을 String으로 바꿔야 해")
                        }
                        .padding()
                        WrongAnswerButton(description: "return 되는 값을 order + name 순서로 바꿔야 해")
                    }
                    .padding(.bottom, 100)
                    
                    Button(action: {self.mapIsActive = false}) {
                        Text("마을로 돌아간다")
                    }
                }
            }
        }
    }
}

struct WrongAnswerButton: View {
    
    let description: String
    @State private var alertShow: Bool = false
    
    var body: some View {
        Button(action: {self.alertShow = true}) {
            Text(description)
        }
        .padding()
        .alert("이런..!", isPresented: $alertShow) {
            Button(action: {self.alertShow = false}) {
                Text("생각하기")
            }
        } message: {
            Text("다시 생각해볼까?")
        }
    }
}
