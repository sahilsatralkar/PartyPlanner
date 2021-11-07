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
    
    @State private var contacts = [FriendInfo.init(firstName: "", lastName: "", phoneNumber: nil)]
    
    private var viewContacts : [FriendInfo] {
        return getContactsForView()
    }
    
    @State private var contactSelected : Int = 0
    @State private var searchText = ""
    @State private var showCancelButton: Bool = false
    
    
    var body: some View {
        NavigationView{
            Form {
                Section {
                    Button {
                        self.showingAddFriendContact = true
                    } label: {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 120, height: 50)
                            .foregroundColor(.brown)
                            .overlay(Text("Add Friend from Contacts"))
                            .foregroundColor(.white)
                            .padding()
                    }
                }
                Section
                {
                    Picker(LocalizedStringKey("PresentSelection"), selection: $contactSelected) {
                        ForEach(0 ..< viewContacts.count) { index in
                            Text(viewContacts[index].firstName + viewContacts[index].lastName)
                        }
                    }
                }
                .font(.headline)
                .pickerStyle(DefaultPickerStyle())
            }
        }
        .navigationTitle("Add friend")
        .sheet(isPresented: $showingAddFriendContact) {
            AddFriendContactView(friend: friend)
        }
        
    }
    
    func getContacts() {
        DispatchQueue.main.async {
            self.contacts = FetchContacts().fetchingContacts()
        }
    }
    
    func getContactsForView() -> [FriendInfo] {
        return FetchContacts().fetchingContacts()
        
    }
    
    func requestAccess() {
        let store = CNContactStore()
        switch CNContactStore.authorizationStatus(for: .contacts) {
        case .authorized:
            self.getContacts()
        case .denied:
            store.requestAccess(for: .contacts) { granted, error in
                if granted {
                    self.getContacts()
                }
            }
        case .restricted, .notDetermined:
            store.requestAccess(for: .contacts) { granted, error in
                if granted {
                    self.getContacts()
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
