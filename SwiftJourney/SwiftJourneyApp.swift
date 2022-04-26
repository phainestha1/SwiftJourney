//
//  SwiftJourneyApp.swift
//  SwiftJourney
//
//  Created by Noah's Ark on 2022/04/21.
//

import SwiftUI

@main
struct SwiftJourneyApp: App {
    @StateObject var userData = MissionComplete()
    
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            Main()
                // Current status of the user, if the user does not save his/her data, it will be gone.
                .environmentObject(userData)
                // This handles saving data into the coredata
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }    
}
