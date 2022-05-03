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
                        .font(.custom("DungGeunMo", size: 14))
                        .padding()
                    
                    Image("wizard")
                    
                    NavigationLink(destination:
                                    Map(backToMain: self.$backToMain)
                                    .navigationBarHidden(true)
                    ) {
                        Text("성공한 미션 수: \(userStatus[0].missionArray.count)")
                            .font(.custom("DungGeunMo", size: 14))
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                        .frame(height: 50)
                    
                    HStack {
                        Button(action: {self.backToMain = false}) {
                            Text("메인으로")
                                .font(.custom("DungGeunMo", size: 14))
                        }
                        .foregroundColor(.white)

                        Spacer()
                            .frame(width: 50)
                        
                        Button(action:  {
                            confirmationShow = true
                        }) {
                            Text("데이터 삭제")
                                .font(.custom("DungGeunMo", size: 14))
                                .foregroundColor(.red)
                        }
                        .foregroundColor(.white)
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
                    }
                }
            }
        }
    }
}
