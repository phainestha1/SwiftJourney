//
//  SavedData.swift
//  SwiftJourney
//
//  Created by Hyeon-sang Lee on 2022/04/26.
//

import SwiftUI
import CoreData

struct SavedData: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var userStatus: FetchedResults<User>
    
    var body: some View {
        NavigationView {
            VStack {
                Text("불러오기")
                    .padding()
                
                Text(userStatus[0].userName ?? "Unknown")
                
                NavigationLink(destination:
                    Map()
                        .navigationBarHidden(true)
                ) {
                    Text("\(userStatus[0].missionArray.count)")
                }
                
//                ForEach(userStatus[0].missionArray, id: \.self) { mission in
//                    Text(mission.wrappedMissionName)
//                }
                
                Button("데이터 삭제") {
                    for user in userStatus {
                        user.removeFromMission(user.mission!)
                    }
                    
                    try? moc.save()
                }
            }
        }
    }
}


struct SavedData_Previews: PreviewProvider {
    static var previews: some View {
        SavedData()
    }
}
