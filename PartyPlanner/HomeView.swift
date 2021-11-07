//
//  HomeView.swift
//  PartyPlanner
//
//  Created by Sahil Satralkar on 06/11/21.
//

import SwiftUI

struct HomeView: View {
    
    
    @State private var userName = ""
    @State private var password = ""

    @ObservedObject var isLoginActive : LoginClass
    
    
    
    var body: some View {
        VStack {
            
            TextField("User Name", text: $userName)
                .frame(width: 250, height: 50, alignment: .center)
                .padding()
            TextField("Password", text: $password)
                .frame(width: 250, height: 50, alignment: .center)
                .padding()
            HStack{
                Button  {
                    userName = ""
                    password = ""
                } label: {
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: 120, height: 50)
                        .foregroundColor(.brown)
                        .overlay(Text("Cancel"))
                        .foregroundColor(.white)
                        .padding()
                }
                Button  {
                    //self.isLoginActive = true
                    self.isLoginActive.loginState = true
                } label: {
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: 120, height: 50)
                        .foregroundColor(.brown)
                        .overlay(Text("Login"))
                        .foregroundColor(.white)
                        .padding()
                }
                
                
            }
            
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(isLoginActive: LoginClass(loginState: false))
    }
}
