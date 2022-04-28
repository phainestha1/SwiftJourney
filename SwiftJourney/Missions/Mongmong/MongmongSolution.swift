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
            VStack {
                Text("방금 전 명령을 스위프트 마법을 통해 분석해보자.")
                Text("무엇이 문제였을까?")
                
                Spacer()
                    .frame(height: 50)
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.white)
                    VStack{
                        Text("var order: Int = '앉아!'")
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
                    Button(action: {}) {
                        Text("1번")
                    }
                    .padding()
                    Button(action: {}) {
                        Text("2번")
                    }
                    .padding()
                    NavigationLink (
                        destination:
                            MongmongSolved(mapIsActive: self.$mapIsActive)
                                .navigationBarBackButtonHidden(true)
                    ) {
                        Text("3번")
                    }
                    .padding()
                    Button(action: {}) {
                        Text("4번")
                    }
                    .padding()
                }
                .padding(.bottom, 100)
                
                Button(action: {self.mapIsActive = false}) {
                    Text("마을로 돌아간다")
                }
            }
        }
    }
}
