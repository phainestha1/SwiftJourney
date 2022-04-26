//
//  SavedData.swift
//  SwiftJourney
//
//  Created by Hyeon-sang Lee on 2022/04/26.
//

import SwiftUI

struct SavedData: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: Mission.entity() , sortDescriptors: [])
    
    var missionSaveData: FetchedResults<Mission>

    
    var body: some View {
        VStack {
            Text("불러오기")
            ForEach(missionSaveData) { item in
                VStack {
                    Text("\(item.missionNo)")
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
