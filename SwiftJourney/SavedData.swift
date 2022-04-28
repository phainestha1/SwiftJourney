//
//  SavedData.swift
//  SwiftJourney
//
//  Created by Hyeon-sang Lee on 2022/04/26.
//

import SwiftUI

struct SavedData: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var userStatus: FetchedResults<User>
    
    var body: some View {
        NavigationView {
            VStack {
                Text("불러오기")
                    .padding()
                
                List {
                    ForEach(userStatus, id: \.self) { user in
                        Section(user.wrappedUserName) {
                            ForEach(user.missionArray, id: \.self) { mission in
                                Text(mission.wrappedMissionName)
                            }
                        }
                    }
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
