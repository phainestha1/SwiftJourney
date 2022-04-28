//
//  Mission+CoreDataProperties.swift
//  SwiftJourney
//
//  Created by Hyeon-sang Lee on 2022/04/28.
//
//

import Foundation
import CoreData


extension Mission {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Mission> {
        return NSFetchRequest<Mission>(entityName: "Mission")
    }

    @NSManaged public var missionName: String?
    @NSManaged public var user: User?
    
    public var wrappedMissionName: String {
     missionName ?? "Unknown Mission"
    }

}

extension Mission : Identifiable {

}
