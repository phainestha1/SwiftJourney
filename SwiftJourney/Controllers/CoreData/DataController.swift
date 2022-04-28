//
//  DataController.swift
//  SwiftJourney
//
//  Created by Hyeon-sang Lee on 2022/04/28.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "SwiftJourney")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("✅✅ Core Data failed to load: \(error.localizedDescription)")
                return
            }

            self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        }
    }
}
