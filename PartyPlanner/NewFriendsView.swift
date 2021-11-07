//
//  NewFriendsView.swift
//  PartyPlanner
//
//  Created by Sahil Satralkar on 07/11/21.
//

import SwiftUI

struct NewFriendsView: View {
    var body: some View {
        NavigationView {
            List{
                Section {
                ForEach (0 ..< 10) { index in
                    NavigationLink(destination: Text("Friend No. \(index)")) {
                        VStack {
                            Text("Friend No. \(index)")
                        }
                        
                    }
                }
                }
                .navigationTitle("Friends")
                .navigationBarItems(trailing: HStack {
                    Button(action :
                            {
                        //
                        
                    })
                    {
                        Image(systemName: "plus")
                        
                    }
                }
                )
            }
            .listStyle(.plain)
        }
        
        
    }
}

struct NewFriendsView_Previews: PreviewProvider {
    static var previews: some View {
        NewFriendsView()
    }
}
