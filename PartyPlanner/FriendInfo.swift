//
//  FriendInfo.swift
//  PartyPlanner
//
//  Created by Sahil Satralkar on 07/11/21.
//

import Contacts
import SwiftUI


struct FriendInfo : Identifiable {
    var id = UUID()
    var firstName: String
    var lastName: String
    var phoneNumber: CNPhoneNumber?
}
