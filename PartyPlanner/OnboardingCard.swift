//
//  OnboardingCard.swift
//  PartyPlanner
//
//  Created by Sahil Satralkar on 06/11/21.
//

import SwiftUI

struct OnboardingCard: Identifiable {
    
    var id = UUID()
    var image : String
    var title : String
    var description : String
}

var cards : [OnboardingCard] = [
    OnboardingCard(image: "image4", title: "Friends & Hobbies", description: "Know your friends better!"),
    OnboardingCard(image: "image4", title: "Easy to navigate", description: "Easy and convineint list of Friends hobbies"),
   // OnboardingCard(image: "image4", title: "Title 3", description: "This is the third screen") //test
]
    



