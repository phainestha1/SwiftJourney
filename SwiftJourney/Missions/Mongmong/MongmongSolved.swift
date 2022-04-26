//
//  MongmongSolved.swift
//  SwiftJourney
//
//  Created by Noah's Ark on 2022/04/21.
//

import SwiftUI

struct MongmongSolved: View {
    
    @Binding var mapIsActive: Bool
    @EnvironmentObject var userData: MissionComplete
    var coreDataItemHandling: CoreDataItemHandling
            
    var body: some View {
        VStack {
            
            Text("몽몽이가 말을 안들어! 미션을 성공하였습니다.")
                .foregroundColor(.red)
            
            Image("mongmongSitDown")
            
            Text("이것이 문제였구나.")
            Text("몽몽이의 입장에서 말을 걸어주렴.")
            
            Button(action: {
                self.mapIsActive = false
            }) {
                Text("마을로 돌아간다.")
            }
        }
        .onAppear {
            coreDataItemHandling.changeItems(number: 1, isSolved: true)
        }
//        .onChange(of: userData.mongmong) { newValue in
//            print(newValue)
//        }
    }
}
