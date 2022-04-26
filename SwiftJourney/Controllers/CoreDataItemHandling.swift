//
//  CoreDataItemHandling.swift
//  SwiftJourney
//
//  Created by Hyeon-sang Lee on 2022/04/26.
//

import Foundation

struct CoreDataItemHandling {
    
    let viewContext = PersistenceController.shared.container.viewContext
    
    func addItem(number: Int64, isSolved: Bool) {
            let newItem = Mission(context: viewContext)
            newItem.missionNo = number
            newItem.isSolved = isSolved

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }

    func changeItems(number: Int64, isSolved: Bool) {
        //Find mission number by the given "number" parameter,
        // and change its status
        // update it!
    }
    
//    func deleteItems(offsets: IndexSet) {
//            offsets.map { items[$0] }.forEach(viewContext.delete)
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//        }
//    }

}
