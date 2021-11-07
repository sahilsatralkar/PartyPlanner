//
//  PartyPlannerApp.swift
//  PartyPlanner
//
//  Created by Sahil Satralkar on 06/11/21.
//

import SwiftUI

@main
struct PartyPlannerApp: App {
    let persistenceController = PersistenceController.shared
    
    @StateObject private var selectedTabObj = SelectedTab()
    @StateObject private var loginClass = LoginClass(loginState: false)

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(selectedTabObj)
                .environmentObject(loginClass)
        }
    }
}
