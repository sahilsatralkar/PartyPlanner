//
//  NewFriendsView.swift
//  PartyPlanner
//
//  Created by Sahil Satralkar on 07/11/21.
//

import SwiftUI

struct NewFriendsView: View {
    
    @State private var showingAddFriend = false
    
    @Environment(\.managedObjectContext) var moc
    
    var fetchRequest = FetchRequest<FriendsEntity>(entity: FriendsEntity.entity(), sortDescriptors : [NSSortDescriptor(keyPath: \FriendsEntity.date, ascending: false)])
    
    var body: some View {
        NavigationView {
            Form {
                Section (header: Text("Tap on + to add New")) {
                    List {
                        ForEach(fetchRequest.wrappedValue, id:\.self) { friend in
                    
                            VStack {
                                HStack{
                                    Image(systemName: "person.crop.circle.fill")
                                        .foregroundColor(.green)
                                    Text(friend.name ?? "")
                                        .font(.title)
                                    Spacer()
                                }
                                HStack {
                                    Image(systemName: "heart.circle.fill")
                                        .foregroundColor(.red)
                                    Text("Hobby: \(friend.hobby ?? "")")
                                        .font(.body)
                                    Spacer()
                                }
                            }
                        }
                        .onDelete(perform: delete)
                    }
                }
            }
            .navigationTitle("Friends & Hobbies")
            .navigationBarItems(trailing: HStack {
                Button(action :
                        {
                    self.showingAddFriend = true
                })
                {
                    Image(systemName: "plus")
                }
            }
            )
            .sheet(isPresented: $showingAddFriend){
                AddFriendView()
            }
        }
    }
    //Function to remove individual items
    func delete( at offsets : IndexSet) {
        for offset in offsets {
            let note = self.fetchRequest.wrappedValue[offset]
            moc.delete(note)
        }
        try? moc.save()
    }
}

struct NewFriendsView_Previews: PreviewProvider {
    static var previews: some View {
        NewFriendsView()
    }
}
