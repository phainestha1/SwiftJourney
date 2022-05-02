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
            ZStack {
                Image("frame")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                
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
                    
                    Button("데이터 삭제") {
                        confirmationShow = true
                    }
                    .alert(isPresented: $confirmationShow) {
                        Alert(
                            title: Text("알림"),
                            message: Text("데이터를 삭제할까요?"),
                            primaryButton: .destructive(Text("네"),
                                                        action: {
                                                            for user in userStatus {
                                                                user.removeFromMission(user.mission!)
                                                                
                                                                try? moc.save()
                                                                
                                                                self.backToMain = false
                                                            }
                                                        }),
                            secondaryButton: .cancel(Text("아니오"))
                        )
                    }
                    
                    Button("메인으로") {
                        self.backToMain = false
                    }
                }
            }
        }
    }
}
