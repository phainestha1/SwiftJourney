//
//  Main.swift
//  SwiftJourney
//
//  Created by Noah's Ark on 2022/04/21.
//

import SwiftUI

struct Main: View {
    
    var saveDataAlive: Bool = false
    
    var body: some View {
        NavigationView {
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
                Button(action: {}) {
                    Image(saveDataAlive ? "continueColor" : "continueGray")
                }
                .frame(height: 10)
                .disabled(!saveDataAlive)
            }
        }
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}
