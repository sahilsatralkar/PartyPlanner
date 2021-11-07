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

    var body: some Scene {
        WindowGroup {
            ContentView(isLoginActive: LoginClass.init(loginState: false))
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
