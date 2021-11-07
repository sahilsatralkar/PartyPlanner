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
    OnboardingCard(image: "image1", title: "Title 1", description: "This is the first screen"),
    OnboardingCard(image: "image2", title: "Title 2", description: "This is the second screen"),
    OnboardingCard(image: "image3", title: "Title 3", description: "This is the third screen")
]
    



