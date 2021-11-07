//
//  AddFriendView.swift
//  PartyPlanner
//
//  Created by Sahil Satralkar on 07/11/21.
//

import SwiftUI
import Contacts

struct AddFriendView: View {
    
    var friend : FriendInfo?
    @State private var showingAddFriendContact = false
    
//    @State private var contacts = [FriendInfo.init(firstName: "", lastName: "", phoneNumber: nil)]
    
    private var viewContacts : [FriendInfo] {
        return getContactsForView()
    }
    
    var Hobbies = ["3D printing",
                   "Acroyoga",
                   "Acting",
                   "Aerial silk",
                   "Airbrushing",
                   "Amateur radio",
                   "Animation",
                   "Anime",
                   "Experimenting",
                   "Filmmaking"
                    ]
    
    @State private var contactSelected : Int = 0
    @State private var hobbySelected : Int = 0
    @State private var searchText = ""
    @State private var showCancelButton: Bool = false
    
    @Environment(\.managedObjectContext) var moc
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView{
            Form {
                Section {
//                    Button {
//                        //self.showingAddFriendContact = true
//                    } label: {
//                        RoundedRectangle(cornerRadius: 5)
//                            .frame(width: 120, height: 50)
//                            .foregroundColor(.brown)
//                            .overlay(Text("Add Friend from Contacts"))
//                            .foregroundColor(.white)
//                            .padding()
//                    }
//                }
                
                    Picker("Select Contact", selection: $contactSelected) {
                        ForEach(0 ..< viewContacts.count) { index in
                            //VStack {
                                Text("\(viewContacts[index].firstName) \(viewContacts[index].lastName)")
                                //Text(viewContacts[index].phoneNumber?.stringValue ?? "")
                            //}
                        }
                    }
                    .pickerStyle(DefaultPickerStyle())
                    Picker("Select Hobby", selection: $hobbySelected) {
                        ForEach(0 ..< Hobbies.count) { index in
                                Text(Hobbies[index])
                        }
                    }
                    .pickerStyle(DefaultPickerStyle())
                
                    HStack {
                        Spacer()
                        Button {
                            //
                            saveFriend()
                            
                        } label: {
                            RoundedRectangle(cornerRadius: 5)
                                .frame(width: 250, height: 50)
                                .foregroundColor(.green)
                                .overlay(Text("Save")
                                            .foregroundColor(.white))
                                .padding()
                        }
                        Spacer()
                    }
                
            }
            }
            .navigationTitle("Add friend")
        }
//        .sheet(isPresented: $showingAddFriendContact) {
//            AddFriendContactView(friend: friend)
//        }
    }
    
    func saveFriend() {
        let newFriend = FriendsEntity(context: moc)
        newFriend.id = UUID().uuidString
        newFriend.name = "\(viewContacts[contactSelected].firstName) \(viewContacts[contactSelected].lastName)"
        newFriend.date = Date()
        newFriend.hobby = Hobbies[hobbySelected]
        
        try? self.moc.save()
        
        self.presentationMode.wrappedValue.dismiss()
    }
    
    
    
    func getContactsForView() -> [FriendInfo] {
        return FetchContacts().fetchingContacts()
        
    }
    
    func requestAccess() {
        let store = CNContactStore()
        switch CNContactStore.authorizationStatus(for: .contacts) {
        case .authorized:
            //self.getContacts()
            print("")
        case .denied:
            store.requestAccess(for: .contacts) { granted, error in
                if granted {
                    //self.getContacts()
                    print("")
                }
            }
        case .restricted, .notDetermined:
            store.requestAccess(for: .contacts) { granted, error in
                if granted {
                    //self.getContacts()
                    print("")
                }
            }
        @unknown default:
            print("error")
        }
    }
}
struct AddFriendView_Previews: PreviewProvider {
    static var previews: some View {
        AddFriendView()
    }
}
