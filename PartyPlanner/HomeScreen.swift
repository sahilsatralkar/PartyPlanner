//
//  HomeScreen.swift
//  PartyPlanner
//
//  Created by Sahil Satralkar on 07/11/21.
//

import SwiftUI

//Class to handle the quick action selection
class SelectedTab : ObservableObject {
    // v.1.4.1
    @Published var tabNumber : TabIdentifier = TabIdentifier.NewFriend
    
}

enum TabIdentifier: Hashable {
    case NewFriend, Settings
}


struct HomeScreen: View {
    
    @EnvironmentObject var selectedTabEnv: SelectedTab
    
    var body: some View {
        
        TabView(selection: $selectedTabEnv.tabNumber) {
            
            NewFriendsView()
                .tabItem {
                    Image(systemName: "person.crop.circle.badge.plus")
                    Text("Add Friend")
                }
                .tag(TabIdentifier.NewFriend)
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
                .tag(TabIdentifier.Settings)
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
