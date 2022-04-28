//
//  User+CoreDataProperties.swift
//  SwiftJourney
//
//  Created by Hyeon-sang Lee on 2022/04/28.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var userName: String?
    @NSManaged public var mission: NSSet?
    
    public var wrappedUserName: String {
        userName ?? "나"
    }
    
    public var missionArray: [Mission] {
        let set = mission as? Set<Mission> ?? []
        return set.sorted {
            $0.wrappedMissionName < $1.wrappedMissionName
        }
    }
}

// MARK: Generated accessors for mission
extension User {

    @objc(addMissionObject:)
    @NSManaged public func addToMission(_ value: Mission)

    @objc(removeMissionObject:)
    @NSManaged public func removeFromMission(_ value: Mission)

    @objc(addMission:)
    @NSManaged public func addToMission(_ values: NSSet)

    @objc(removeMission:)
    @NSManaged public func removeFromMission(_ values: NSSet)

}

extension User : Identifiable {

}
