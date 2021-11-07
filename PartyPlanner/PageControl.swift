//
//  PageControl.swift
//  PartyPlanner
//
//  Created by Sahil Satralkar on 06/11/21.
//

import SwiftUI

struct PageControl: UIViewRepresentable {
    
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> some UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        control.pageIndicatorTintColor = UIColor.systemGray
        control.currentPageIndicatorTintColor = UIColor(red: 85/255, green: 202/255, blue: 203/255, alpha: 1)
        control.frame(forAlignmentRect: CGRect(origin: .zero, size: CGSize(width: 30, height: 30)))
        
        control.addTarget(context.coordinator, action: #selector(Coordinator.updateCurrentPage(sender:)), for: .valueChanged)
        
        return control
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.currentPage = currentPage
    }
    
    class Coordinator : NSObject {
        var control: PageControl
        
        init ( _ control: PageControl) {
            self.control = control
        }
        @objc func updateCurrentPage(sender: UIPageControl) {
            control.currentPage = sender.currentPage
        }
    }
}
