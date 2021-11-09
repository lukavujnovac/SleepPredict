//
//  WelcomeView.swift
//  SleepPredict
//
//  Created by Luka Vujnovac on 09.11.2021..
//

import SwiftUI

struct WelcomeView: View {
    
    @State private var showingLogInView: Bool = false
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(Color("backgroundColor"))
                .ignoresSafeArea()
            
            VStack(spacing: 40){
                Image(systemName: "circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 180, height: 180)
                
                Text("smartRest")
                    .font(Font.system(size: 40))
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .shadow(radius: 10)
            }.padding(.bottom, 80)
            
            VStack(spacing: 30){
                Spacer()
                
                RoundedRectangle(cornerRadius: 20)
                    .frame(height: 65)
                    .padding(.horizontal, 30)
                    .foregroundColor(.white)
                    .shadow(radius: 10)
                    .overlay(
                        Text("Sign Up")
                            .font(Font.system(size: 25))
                            .fontWeight(.medium)
                            .foregroundColor(Color("backgroundColor"))
                            .shadow(radius: 10)
                    )
                
                LogInButton()
                    .onTapGesture {
                        showingLogInView.toggle()
                    }
            }
        }
        .sheet(isPresented: $showingLogInView) { 
            LogInView()
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
            .frame(height: 65)
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
