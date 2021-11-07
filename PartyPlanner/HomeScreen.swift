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
    @Published var tabNumber : TabIdentifier = TabIdentifier.NewEvent
    
}

enum TabIdentifier: Hashable {
    case NewEvent, UpcomingEvents, PastEvents
}


struct HomeScreen: View {
    
    @EnvironmentObject var selectedTabEnv: SelectedTab
    
    var body: some View {
        
        TabView(selection: $selectedTabEnv.tabNumber) {
            
            NewEvent()
                .tabItem {
                    Image(systemName: "goforward.plus")
                    Text("New Event")
                }
                .tag(TabIdentifier.NewEvent)
            
            UpcomingEvent()
                .tabItem {
                    Image(systemName: "exclamationmark.circle")
                    Text("Upcoming Events")
                }
                .tag(TabIdentifier.UpcomingEvents)
            PastEvents()
                .tabItem {
                    Image(systemName: "gobackward")
                    Text("Past Events")
                }
                .tag(TabIdentifier.PastEvents)
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
