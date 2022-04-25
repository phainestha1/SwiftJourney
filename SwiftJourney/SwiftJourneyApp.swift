//
//  SwiftJourneyApp.swift
//  SwiftJourney
//
//  Created by Noah's Ark on 2022/04/21.
//

import SwiftUI

@main
struct SwiftJourneyApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            Main()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
