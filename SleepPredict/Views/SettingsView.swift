//
//  SettingsView.swift
//  SleepPredict
//
//  Created by Luka Vujnovac on 20.11.2021..
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var vm: AuthViewModel
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.black)
                .ignoresSafeArea()
            ScrollView{
                VStack {
                    Spacer()
                    
                    Button {
                        vm.signOut()
                    } label: { 
                        Text("Sign out")
                            .font(Font.system(size: 20, weight: .semibold, design: .rounded))
                            .foregroundColor(.red)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(20)
                    }
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
