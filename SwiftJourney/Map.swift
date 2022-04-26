//
//  Map.swift
//  SwiftJourney
//
//  Created by Noah's Ark on 2022/04/21.
//

import SwiftUI

struct Map: View {
    
    @State var backToMap: Bool = false
    @EnvironmentObject var userData: MissionComplete

    
    var body: some View {
        NavigationView {
            VStack {
                Button(action:{}) {
                    Text("저장하기")
                }

                Text("어디로 가볼까?")
                
                Spacer()
                    .frame(height: 50)
                
                NavigationLink(destination:
                            MongmongIntro(mapIsActive: self.$backToMap)
                                .navigationBarTitleDisplayMode(.inline)
                                .navigationBarBackButtonHidden(true)
                                .toolbar {
                                    ToolbarItem(placement: .principal) {
                                        VStack {
                                            Text("몽몽이가 말을 안들어!").font(.headline)
                                        }
                                    }
                                },
                            isActive: self.$backToMap
                ) {
                    Text("몽몽이가 말을 안들어!")
                }
                .isDetailLink(false)
                .padding()
                .disabled(userData.mongmong)

// Will be Updated. 🔥🔥🔥🔥
//                NavigationLink(destination:
//                                Forgetfulness()
//                                    .navigationBarTitleDisplayMode(.inline)
//                                    .navigationBarBackButtonHidden(true)
//                                    .toolbar {
//                                        ToolbarItem(placement: .principal) {
//                                            VStack {
//                                                Text("기억이 안나는구먼..").font(.headline)
//                                            }
//                                        }
//                                    },
//                               isActive: self.$backToMap
//                ) {
//                    Text("기억이 안나는구먼..")
//                }
//                .isDetailLink(false)
//                .padding()
                
            }
        }
        .onAppear {
            print(userData.mongmong)
        }

    }
}

struct Map_Previews: PreviewProvider {
    static var previews: some View {
        Map()
    }
}
