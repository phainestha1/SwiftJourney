//
//  Main.swift
//  SwiftJourney
//
//  Created by Noah's Ark on 2022/04/21.
//

import SwiftUI
import CoreData

struct Main: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var userStatus: FetchedResults<User>
    
    @State var backToMainFromSave: Bool = false
    @State var backToMainFromNewGame: Bool = false
    @State var backToMainFromStory: Bool = false
    @State private var alertShow: Bool = false

    func detectUserData() -> Bool {
        return userStatus.isEmpty
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
                    .opacity(0.35)
                
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
                            if !userStatus.isEmpty, userStatus[0].missionArray != [] {
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
                        Image(
                            userStatus.isEmpty
                            ? "continueGray"
                            : userStatus[0].missionArray != []
                                ? "continueColor"
                                : "continueGray"
                        )
                    }
                    .isDetailLink(false)
                    .frame(height: 10)
                    .disabled(
                        userStatus.isEmpty
                        ? true
                        : userStatus[0].missionArray != []
                            ? false
                            : true
                    )
                
                    Spacer()
                        .frame(height: 50)
                    
                    NavigationLink(
                        destination: Story(backToMain : self.$backToMainFromStory)
                                        .navigationBarHidden(true),
                        isActive: self.$backToMainFromStory
                    ) {
                        Image("storyColor")
                        
                    }
                    .isDetailLink(false)
                    .frame(height: 10)
                }
                .padding(.bottom, 150)
            }
        }
    }
}
