//
//  LogInView.swift
//  SleepPredict
//
//  Created by Luka Vujnovac on 17.11.2021..
//

import SwiftUI

struct LogInView: View {
    
    @State var email = ""
    @State var password = ""
    
    @StateObject private var vm = LoginViewModel()
    @EnvironmentObject var authVM: AuthViewModel
    
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
                        
                        TextField("", text: $email)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
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
                        
                        SecureField("", text: $password)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                            .frame(width: 250 ,height: 55)
                            .padding(.horizontal, 50)
                            .background(Color("textFieldColor"))
                            .cornerRadius(20)
                    }
                }
                Button { 
                    
                    guard !email.isEmpty, !password.isEmpty else {return}
                    
                    authVM.logIn(email: email, password: password)
                } label: { 
                    StandardButton(
                        text: "Log In"
                        , textColor: .white
                        , foregroundColor: Color("darkPurple"))
                }
                
                NavigationLink("Create Account", destination: SignUpView())

                Spacer()
            }
        }
    }
}

//        .navigationBarBackButtonHidden(true)
//        .navigationBarHidden(true)

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}


