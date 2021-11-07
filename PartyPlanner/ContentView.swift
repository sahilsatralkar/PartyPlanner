//
//  ContentView.swift
//  PartyPlanner
//
//  Created by Sahil Satralkar on 06/11/21.
//

import SwiftUI
import CoreData



struct ContentView: View {
    
    
    @State var isOnboarding = false
    @State private var animationAmount = 1.0
    
    @EnvironmentObject var isLoginActive : LoginClass
    
    var body: some View {
        Group {
            if isOnboarding {
                
                if isLoginActive.loginState {
                    HomeScreen()
                }
                else {
                    HomeView(isLoginActive: isLoginActive)
                        .animation(
                            .easeInOut(duration: 2)
                                .delay(3),
                            value: animationAmount
                        )
                }
                
                
            } else {
                PageView(cards.map {
                    OnboardingCardView(card: $0)
                }, isOnboardingDone: $isOnboarding)
            }
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
