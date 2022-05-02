//
//  Map.swift
//  SwiftJourney
//
//  Created by Noah's Ark on 2022/04/21.
//

import SwiftUI

struct Map: View {
    
    var isNewGame: Bool?
    @State var backToMap: Bool = false
    @Binding var backToMain: Bool
    @FetchRequest(sortDescriptors: []) var userStatus: FetchedResults<User>
    
    // Search mission array with the "For" loop and matches mission names with the given parameter.
    func completionVerification(missionName: String) -> Bool {
        if !userStatus.isEmpty {
            for mission in userStatus[0].missionArray {
                if mission.missionName == missionName {
                    return true
                }
            }
        }
        
        return false
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("village")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .frame(height: UIScreen.main.bounds.height)
                
                Rectangle()
                    .edgesIgnoringSafeArea(.all)
                    .frame(height: UIScreen.main.bounds.height)
                    .background(.black)
                    .opacity(0.15)
                
                VStack {
                    Text("어디로 가볼까?")
                        .foregroundColor(.white)
                    
                    Spacer()
                        .frame(height: 50)
                    
                    NavigationLink(
                        destination:
                            MongmongIntro(mapIsActive: self.$backToMap)
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarBackButtonHidden(true)
                            .toolbar {
                                ToolbarItem(placement: .principal) {
                                    VStack {
                                        Text("몽몽이가 말을 안들어!")
                                            .font(.headline)
                                    }
                                }
                            },
                        isActive: self.$backToMap
                    ) {
                        Text("몽몽이가 말을 안들어!")
                            .foregroundColor(completionVerification(missionName: "mongmong") == true ? .gray : .white)
                    }
                    .isDetailLink(false)
                    .padding()
                    // 🔥 Should verify if this screen is navigated by "Continue" or "New Game"
                    // 🔥 Binding? Environment? Maybe no..
                    // 🔥 Find the best way!! Now installed with observableobject
                    .disabled(completionVerification(missionName: "mongmong"))
                    
                    Button("메인으로") {
                        self.backToMain = false
                    }
                    .foregroundColor(.white)
                }
            }
        }
    }
}
