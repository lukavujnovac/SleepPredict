//
//  BackgroundView.swift
//  SleepPredict
//
//  Created by Luka Vujnovac on 04.11.2021..
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color("firstBackgroundColor"),Color("secondBackgroundColor"),  Color("thirdBackgroundColor")], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack(spacing: 40){
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(Color("gold"))
                    .shadow(radius: 10)
                    .padding()
                    .padding(.horizontal, 60)
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    Image(systemName: "star.fill")
                        .foregroundColor(Color("gold"))
                    .shadow(radius: 10)
                    .padding()
                    .padding(.trailing, 180)
                }
                
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(Color("gold"))
                    .shadow(radius: 10)
                    .padding()
                }.padding(.top, 90)
                Spacer()
                
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(Color("gold"))
                    .shadow(radius: 10)
                    .padding()
                }.padding(.bottom, 80)
                
                HStack {
                    Spacer()
                    Image(systemName: "star.fill")
                        .foregroundColor(Color("gold"))
                    .shadow(radius: 10)
                    .padding()
                    .padding(.trailing, 140)
                }
                
                HStack {
                    Spacer()
                    Image(systemName: "star.fill")
                        .foregroundColor(Color("gold"))
                    .shadow(radius: 10)
                    .padding()
                    .padding(.horizontal, 60)
                }
            }.padding()
        }
    }
}


struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
