//
//  Main.swift
//  SwiftJourney
//
//  Created by Noah's Ark on 2022/04/21.
//

import CoreData
import SwiftUI

struct Main: View {
    var saveDataAlive: Bool = true
    
    // What about changing saving interfaces?
    // Just show user's profile and his/her current status
    // like how many questions he solved.. or when was the last login..
    // and user should select continue button to move to the map screen.
    // Cool~!
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var userStatus: FetchedResults<User>
    
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
                    NavigationLink(destination:
                        Intro()
                            .navigationBarHidden(true)
                    ) {
                        Image("startColor")
                    }
                    .isDetailLink(false)
                    .frame(height: 10)
                    
                    Spacer()
                        .frame(height: 50)
                    
                    // Set Coredata to sava and load user's status.
                    // Disabled when there are no previous records.
                    NavigationLink(destination:
                        SavedData()
                            .navigationBarHidden(true)
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

//struct Main_Previews: PreviewProvider {
//    static var previews: some View {
//        Main()
//    }
//}
