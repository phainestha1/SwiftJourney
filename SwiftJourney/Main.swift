//
//  Main.swift
//  SwiftJourney
//
//  Created by Noah's Ark on 2022/04/21.
//

import SwiftUI
import CoreData

struct Main: View {
    // What about changing saving interfaces?
    // Just show user's profile and his/her current status
    // like how many questions he solved.. or when was the last login..
    // and user should select continue button to move to the map screen.
    // Cool~!
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var userStatus: FetchedResults<User>
    
    @State var backToMainFromSave: Bool = false
    @State var backToMainFromNewGame: Bool = false
    @State private var alertShow: Bool = false

    
    func detectUserData() -> Bool {
        if userStatus[0].missionArray == [] {
            return true
        } else {
            return false
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("background")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .frame(height: UIScreen.main.bounds.height)
                
                Rectangle()
                    .edgesIgnoringSafeArea(.all)
                    .frame(height: UIScreen.main.bounds.height)
                    .background(.black)
                    .opacity(0.15)
                
                VStack {
                    Image("logo")
                        .frame(height: 80)
                    
                    Spacer()
                        .frame(height: 50)
                    
                    // Start a new game.
                    NavigationLink(
                        destination:
                            Intro(backToMain: self.$backToMainFromNewGame)
                                .navigationBarHidden(true),
                        isActive: self.$backToMainFromNewGame
                    ) {
                        Button(action: {
                            //✅ Detect whether there are saved data
                            if userStatus[0].missionArray != [] {
                                alertShow = true
                            } else {
                                alertShow = false
                                self.backToMainFromNewGame = true
                            }
                        }) {
                            Image("startColor")
                        }
                        // ✅ Users will get the alert message if he/she already has saved experiences.
                        .alert(isPresented: $alertShow) {
                            Alert(
                                title: Text("알림"),
                                message: Text("기존 데이터를 삭제한 후 새로운 게임을 시작할까요?"),
                                primaryButton: .destructive(Text("네"),
                                action: {
                                    // ✅ Move to the intro page to start a new game.
                                    for user in userStatus {
                                        user.removeFromMission(user.mission!)

                                        try? moc.save()
                                        
                                        self.backToMainFromNewGame = true
                                    }
                                }),
                                secondaryButton: .cancel(Text("아니오"))
                            )
                        }
                    }
                    .isDetailLink(false)
                    .frame(height: 10)
                    
                    Spacer()
                        .frame(height: 50)
                    
                    // Set Coredata to sava and load user's status.
                    // Disabled when there are no previous records.
                    NavigationLink(
                        destination: SavedData(backToMain : self.$backToMainFromSave)
                                        .navigationBarHidden(true),
                        isActive: self.$backToMainFromSave
                    ) {
                        Image(!detectUserData() ? "continueColor" : "continueGray")
                    }
                    .isDetailLink(false)
                    .frame(height: 10)
                    .disabled(detectUserData())
                    
                }
                .padding(.bottom, 150)
            }
        }
    }
}
