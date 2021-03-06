//
//  MongmongSolved.swift
//  SwiftJourney
//
//  Created by Noah's Ark on 2022/04/21.
//

import SwiftUI

struct MongmongSolved: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var userStatus: FetchedResults<User>
    
    @Binding var mapIsActive: Bool
    
    var body: some View {
        ZStack {
            Image("frame")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("몽몽이가 말을 안들어! 미션을 성공하였습니다.")
                    .foregroundColor(.white)
                    .font(.custom("DungGeunMo", size: 14))
                
                Image("mongmongSitDown")

                ZStack {
                    Image("messageBox")
                        .resizable()
                        .frame(width: 350, height: 180)
                    
                    Text("이것이 문제였구나.\n몽몽이의 입장에서 말을 걸어주렴.")
                        .foregroundColor(.white)
                        .font(.custom("DungGeunMo", size: 14))
                        .multilineTextAlignment(.center)
                }
                
                Spacer()
                    .frame(height: 50)
                
                Button(action: {
                    let mission1 = Mission(context: moc)
                    mission1.missionName = "mongmong"
                    mission1.user = User(context: moc)
                    mission1.user?.userName = "나"
                    
                    try? moc.save()
                    
                    self.mapIsActive = false
                    
                }) {
                    Text("마을로 돌아간다.")
                        .foregroundColor(.white)
                        .font(.custom("DungGeunMo", size: 14))
                }
            }
        }
    }
}
