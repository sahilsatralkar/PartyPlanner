//
//  LoginClass.swift
//  PartyPlanner
//
//  Created by Sahil Satralkar on 07/11/21.
//

import Foundation

class LoginClass : ObservableObject {
    
    init(loginState : Bool) {
        self.loginState = loginState
        
    }
    @Published var loginState : Bool = false
}
