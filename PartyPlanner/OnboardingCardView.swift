//
//  OnboardingCardView.swift
//  PartyPlanner
//
//  Created by Sahil Satralkar on 06/11/21.
//

import SwiftUI

struct OnboardingCardView: View {
    
    var card : OnboardingCard
    var body: some View {
        VStack {
                Text(card.title)
                    .font(.title)
                    .foregroundColor(.orange)
                Image(card.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300, alignment: .center)
                Text(card.description)
                    .font(.body)
                    .foregroundColor(.blue)
                    .multilineTextAlignment(.center)
                
            }
            .padding()
            
            
    }
}

struct OnboardingCardView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingCardView(card: cards[0])
    }
}
