//
//  PageView.swift
//  PartyPlanner
//
//  Created by Sahil Satralkar on 06/11/21.
//

import SwiftUI

struct PageView<Page:View>: View {
    
    var viewControllers : [UIHostingController<Page>]
    
    @Binding var isOnboardingDone : Bool
    
    @State var currentPage: Int = 0
    
    @State private var animationAmount = 1.0

    
    init(_ views: [Page], isOnboardingDone: Binding<Bool>) {
        self.viewControllers = views.map {
            UIHostingController(rootView: $0)
        }
        self._isOnboardingDone = isOnboardingDone
    }
    
    var body: some View {
        VStack {
            PageViewController(controllers: viewControllers, currentPage: $currentPage)

            Button {
                if (self.currentPage) < (self.viewControllers.count - 1) {
                    self.currentPage += 1
                } else {
                    withAnimation(.easeIn(duration: 0.3)) {
                        self.isOnboardingDone.toggle()
                    }
                    
                }
            } label: {
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: 250, height: 50)
                    .foregroundColor(Color(red: 85/255, green: 202/255, blue: 203/255 ))
                    .overlay(Text(self.currentPage < self.viewControllers.count - 1  ? "Next" : "Got it")
                                .foregroundColor(.white))

                    
            }
            
            PageControl(numberOfPages: viewControllers.count, currentPage: $currentPage)
        }
        
    }
}



//struct PageView_Previews: PreviewProvider {
//    static var previews: some View {
//        PageView(cards.map {
//            OnboardingCardView(card: $0)
//        }
//        )
//    }
//}
