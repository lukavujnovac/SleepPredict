//
//  LogInView.swift
//  SleepPredict
//
//  Created by Luka Vujnovac on 09.11.2021..
//

import SwiftUI

struct LogInView: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    @State private var typingUsername: Bool = false
    @State private var typingPassword: Bool = false
    
    var body: some View {
        ZStack {
               Rectangle()
                .foregroundColor(Color("backgroundColor"))
                .ignoresSafeArea()
            
            VStack{
                VStack(spacing: 30) {
                    Image(systemName: "circle")
                        .resizable()
                        .scaledToFit()
                    .frame(width: 180, height: 180)
                    
                    Text(" “We help You sleep better“ ")
                        .fontWeight(.semibold)
                        .font(Font.system(size: 20))
                        .foregroundColor(Color("backgroundColor"))
                }
                
                Spacer()
                
                VStack(spacing: 30) {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(height: 65)
                        .padding(.horizontal, 30)
                        .foregroundColor(typingUsername ? Color("backgroundColor") : .white)
                        .shadow(color: .black, radius: 10, x: 2, y: 1)
                        .overlay(
                            TextField("Username", text: $username)
                                .padding(.horizontal, 50)
                    )
                        .onTapGesture {
                            withAnimation(.default) {
                                typingUsername = true   
                            }
                        }
                 
                    RoundedRectangle(cornerRadius: 20)
                        .frame(height: 65)
                        .padding(.horizontal, 30)
                        .foregroundColor(typingPassword ? Color("backgroundColor") : .white)
                        .shadow(color: .black, radius: 10, x: 2, y: 1)
                        .overlay(
                            TextField("Password", text: $username)
                                .padding(.horizontal, 50)
                        )
                        .onTapGesture {
                            withAnimation(.default) {
                                typingPassword = true   
                            }
                        }
                }
                
                Spacer()
                
                LogInButton()
            }
            .padding()
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
