//
//  AddFriendContactView.swift
//  PartyPlanner
//
//  Created by Sahil Satralkar on 07/11/21.
//

import SwiftUI
import Contacts

struct AddFriendContactView: View {
    var friend: FriendInfo?
    
    @State private var contacts = [FriendInfo.init(firstName: "", lastName: "", phoneNumber: nil)]
    @State private var searchText = ""
    @State private var showCancelButton: Bool = false
    @Environment(\.presentationMode) var presentationMode

    
    var body: some View {
        VStack {
            HStack {
                HStack {
                    //search bar magnifying glass image
                    Image(systemName: "magnifyingglass").foregroundColor(.secondary)
                    
                    //search bar text field
                    TextField("search", text: self.$searchText, onEditingChanged: { isEditing in
                        self.showCancelButton = true
                    })
                    
                    // x Button
                    Button(action: {
                        self.searchText = ""
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.secondary)
                            .opacity(self.searchText == "" ? 0 : 1)
                    }
                }
                .padding(8)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(8)
            
            }
            .padding([.leading, .trailing,.top])
            
            List {
                ForEach (self.contacts.filter({ (cont) -> Bool in
                    self.searchText.isEmpty ? true :
                    "\(cont)".lowercased().contains(self.searchText.lowercased())
                })) { contact in
                    ContactRow(contact: contact)
                        .onTapGesture {
                            print("hello \(contact.firstName)")
                            
                            self.presentationMode.wrappedValue.dismiss()
                        }
                }
            }.onAppear() {
                self.requestAccess()
            }
        }
    }
    
    
    struct ContactRow: View {
        var contact: FriendInfo
        var body: some View {
            Text("\(contact.firstName) \(contact.lastName)").foregroundColor(.primary)
        }
    }
    
    func getContacts() {
        DispatchQueue.main.async {
            self.contacts = FetchContacts().fetchingContacts()
        }
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

struct AddFriendContactView_Previews: PreviewProvider {
    static var previews: some View {
        AddFriendContactView()
    }
}
