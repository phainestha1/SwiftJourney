//
//  Main.swift
//  SwiftJourney
//
//  Created by Noah's Ark on 2022/04/21.
//

import SwiftUI

struct Main: View {
    var saveDataAlive: Bool = true
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("background")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .frame(height: UIScreen.main.bounds.height)
                
                VStack {
                    Image("logo")
                        .frame(height: 80)
                    
                    Spacer()
                        .frame(height: 50)
                    
                    // Start a new game.
                    NavigationLink(destination: Intro().navigationBarHidden(true)) {
                        Image("startColor")
                    }
                    .isDetailLink(false)
                    .frame(height: 10)
                    
                    Spacer()
                        .frame(height: 40)
                    
                    // Set Coredata to sava and load user's status.
                    // Disabled when there are no previous records.
                    NavigationLink(destination: SavedData().navigationBarHidden(true)) {
                        Image(saveDataAlive ? "continueColor" : "continueGray")

                    }
                    .isDetailLink(false)
                    .frame(height: 10)
                    .disabled(!saveDataAlive)
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
