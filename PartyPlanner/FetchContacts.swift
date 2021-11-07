//
//  FetchContacts.swift
//  PartyPlanner
//
//  Created by Sahil Satralkar on 07/11/21.
//

import Foundation
import Contacts

class FetchContacts {
    
    func fetchingContacts() -> [FriendInfo]{
        var contacts = [FriendInfo]()
        let keys = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey]
        let request = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])
        do {
            try CNContactStore().enumerateContacts(with: request, usingBlock: { (contact, stopPointer) in
                contacts.append(FriendInfo(firstName: contact.givenName, lastName: contact.familyName, phoneNumber: contact.phoneNumbers.first?.value))
            })
        } catch let error {
            print("Failed", error)
        }
        contacts = contacts.sorted {
            $0.firstName < $1.firstName
        }
        return contacts
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
