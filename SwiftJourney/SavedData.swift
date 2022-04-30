//
//  SavedData.swift
//  SwiftJourney
//
//  Created by Hyeon-sang Lee on 2022/04/26.
//

import SwiftUI
import CoreData

struct SavedData: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var userStatus: FetchedResults<User>
    
    @State private var confirmationShow: Bool = false
    @Binding var backToMain: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                Text("불러오기")
                    .padding()
                
                Text(userStatus[0].userName ?? "Unknown")
                
                Image("wizard")
                
                NavigationLink(destination:
                                Map(backToMain: self.$backToMain)
                    .navigationBarHidden(true)
                ) {
                    Text("성공한 미션 수: \(userStatus[0].missionArray.count)")
                }
                
                //                ForEach(userStatus[0].missionArray, id: \.self) { mission in
                //                    Text(mission.wrappedMissionName)
                //                }
                
                Button("데이터 삭제") {
                    confirmationShow = true
                }
                .confirmationDialog("데이터를 삭제하시겠습니까?", isPresented: $confirmationShow) {
                    Button("네", role: .destructive) {
                        for user in userStatus {
                            user.removeFromMission(user.mission!)
                            
                            try? moc.save()
                            
                            self.backToMain = false
                        }
                    }
                    Button("아니오", role: .cancel) {}
                }
                
                Button("메인으로") {
                    self.backToMain = false
                }
            }
        }
    }
}
