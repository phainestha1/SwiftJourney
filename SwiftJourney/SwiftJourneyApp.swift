//
//  SwiftJourneyApp.swift
//  SwiftJourney
//
//  Created by Noah's Ark on 2022/04/21.
//

import SwiftUI

@main
struct SwiftJourneyApp: App {
    @StateObject var backToMap = BackToMap()
    @StateObject var dataController = DataController()
    @StateObject var newGameVerificaiton = NewGameVerification()
    
    var body: some Scene {
        WindowGroup {
            Main()
            // Current status of the user, if the user does not save his/her data, it will be gone.
                .environmentObject(backToMap)
                .environmentObject(newGameVerificaiton)
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
