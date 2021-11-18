//
//  SignUpView.swift
//  SleepPredict
//
//  Created by Luka Vujnovac on 17.11.2021..
//

import SwiftUI
import Combine

struct SignUpView: View {
    
    @StateObject private var vm = SignUpViewModel()
    
    @State private var passwordsMatching: Bool = true
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.black)
                .ignoresSafeArea()
            
            VStack(spacing: 100) {
                
                VStack(spacing: 15){
                        LogoView()
                        Text("smartRest")
                            .foregroundColor(Color("lightPurple"))
                            .font(Font.system(size: 30))
                            .fontWeight(.semibold)
                }.padding(.top, 50)
                
                VStack(spacing: 15){
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Email:")
                            .foregroundColor(Color("textFieldColor"))
                            .fontWeight(.medium)
                            .padding(.leading, 20)
                            
                        TextField("", text: $vm.username)
                            .frame(width: 250 ,height: 55)
                            .padding(.horizontal, 50)
                            .background(Color("textFieldColor"))
                        .cornerRadius(20)
                    }
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Password:")
                            .foregroundColor(Color("textFieldColor"))
                            .fontWeight(.medium)
                            .padding(.leading, 20)
                        
                        SecureField("", text: $vm.password1)
                            .frame(width: 250 ,height: 55)
                            .padding(.horizontal, 50)
                            .background(Color("textFieldColor"))
                        .cornerRadius(20)
                    }
                    
                    VStack(alignment: .leading) {
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Confirm password:")
                                .foregroundColor(Color("textFieldColor"))
                                .fontWeight(.medium)
                                .padding(.leading, 20)
                            
                            if !passwordsMatching {
                                Text("Passwords not matching")
                                    .fontWeight(.medium)
                                    .padding(.leading, 20)
                                    .foregroundColor(Color("errorColor"))
                            }
                            
                            SecureField("", text: $vm.password2)
                                .frame(width: 250 ,height: 55)
                                .padding(.horizontal, 50)
                                .background(
                                    passwordsMatching ? Color("textFieldColor") : Color("errorColor"))
                            .cornerRadius(20)
                        }
                    }
                }
                StandardButton(
                    text: "Sign Up",
                    textColor: Color("darkPurple"),
                    foregroundColor: .white)
                    .onTapGesture {
                        if vm.checkPasswordsMatching() {
                            withAnimation(.default) {
                                passwordsMatching = true
                            } 
                        }else {
                            withAnimation(.default) {
                                passwordsMatching = false
                            }
                        }
                    }
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
