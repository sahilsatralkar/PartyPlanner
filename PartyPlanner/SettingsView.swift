//
//  SettingsView.swift
//  PartyPlanner
//
//  Created by Sahil Satralkar on 07/11/21.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            Text("Add new settings screen")
                .navigationBarTitleDisplayMode(.large)
                .navigationTitle("Settings")
        }
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
