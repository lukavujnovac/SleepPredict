//
//  ContentView.swift
//  SleepPredict
//
//  Created by Luka Vujnovac on 20.11.2021..
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var vm : AuthViewModel
    var body: some View {
        NavigationView{
            if vm.signedIn {
                Home()
                    .navigationBarHidden(true)
            } else {
                LogInView()
            }
        }.onAppear{
            vm.signedIn = vm.isSignedIn
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
