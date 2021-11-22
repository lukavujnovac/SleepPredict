//
//  WelcomeView.swift
//  SleepPredict
//
//  Created by Luka Vujnovac on 09.11.2021..
//

import SwiftUI

struct WelcomeView: View {    
    var body: some View {
        NavigationView{
            ZStack{
                Rectangle()
                    .foregroundColor(.black)
                    .ignoresSafeArea()
                
                VStack(spacing: 50){
                    LogoView()
                    
                    VStack(spacing: 10) {
                        Text("smartRest")
                            .foregroundColor(Color("lightPurple"))
                            .font(Font.system(size: 40))
                        .fontWeight(.semibold)
                        
                        Text(" We help you sleep better")
                            .foregroundColor(Color("purple"))
                            .font(Font.system(size: 20))
                            .fontWeight(.light)
                    }
                    
                    Spacer()
                    
                    VStack(spacing: 25){
                        
                        NavigationLink { 
                            SignUpView()
                        } label: { 
                            StandardButton(
                                text: "Sign Up",
                                textColor: Color("darkPurple"),
                                foregroundColor: .white)
                        }

                        NavigationLink { 
                            LogInView()
                        } label: { 
                            StandardButton(
                                text: "Log In",
                                textColor: .white,
                                foregroundColor: Color("darkPurple"))
                        }
                    }
                }
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}

struct LogInButton: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .frame(height: 55)
            .padding(.horizontal, 30)
            .foregroundColor(.purple)
            .shadow(radius: 10)
            .overlay(
                Text("Log In")
                    .font(Font.system(size: 25))
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    .shadow(radius: 10)
            )
    }
}

struct StandardButton: View {
    
    var text: String
    var textColor: Color
    var foregroundColor: Color
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .foregroundColor(foregroundColor)
            .frame(height: 70)
            .padding(.horizontal, 50)
            .shadow(color: foregroundColor, radius: 10)
            .overlay(
                Text(text)
                    .font(Font.system(size: 25))
                    .foregroundColor(textColor)
                    .fontWeight(.semibold)
            )
    }
}

struct LogoView: View {
    var body: some View {
        Image(systemName: "circle")
            .resizable()
            .foregroundColor(.white)
            .scaledToFit()
            .frame(width: 130, height: 130)
            .padding(.top, 50)
    }
}
