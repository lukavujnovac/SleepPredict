//
//  Home.swift
//  SleepPredict
//
//  Created by Luka Vujnovac on 04.11.2021..
//  

import SwiftUI

struct Home: View {
    
    @State private var goalCompleted: Bool = false
    
    var body: some View {
        NavigationView{
            ZStack {
                Rectangle()
                    .foregroundColor(.black)
                    .ignoresSafeArea()
                
                VStack(spacing: 25){
                    CardTabView(
                        text: "Sleep"
                        , color1: Color("darkPurple")
                        , color2: Color("purple")
                        , imageName: "moon")
                        .opacity(goalCompleted ? 1.0 : 0.5)
                        .onTapGesture {
                            withAnimation(.default) {
                                goalCompleted.toggle()
                            }
                        }  
                    
                    CardTabView(text: "Meditation", color1: Color("darkGreen"),color2: Color("green"), imageName: "circle")
                        .opacity(goalCompleted ? 1.0 : 0.5)
                    
                    HStack(spacing: 30) {
                        NavigationLink { 
                            HydrationView()
                        } label: { 
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(.blue)
                                .frame(height: 120)
                                .frame(maxWidth: UIScreen.main.bounds.width / 2)
                                .overlay(
                                    ZStack {
                                        LinearGradient(colors: [Color("darkBlue"), Color("blue")], startPoint: .top, endPoint: .bottom)
                                            .cornerRadius(20)
                                        
                                        VStack(alignment: .leading, spacing: 20) {
                                            HStack {
                                                Image(systemName: "cup.and.saucer")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 35, height: 35)
                                                    .foregroundColor(.white)
                                                Spacer()
                                            }.padding(.leading, 5)
                                            
                                            Text("Hydration")
                                                .foregroundColor(.white)
                                                .font(Font.system(size: 20, weight: .medium, design: .rounded))
                                        }.padding(.leading, 30)
                                    }
                                )
                                .opacity(goalCompleted ? 1.0 : 0.5)
                        }
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.blue)
                            .frame(height: 120)
                            .frame(maxWidth: UIScreen.main.bounds.width / 2)
                            .overlay(
                                ZStack {
                                    LinearGradient(colors: [Color("darkBlue"), Color("blue")], startPoint: .top, endPoint: .bottom)
                                        .cornerRadius(20)
                                    
                                    VStack(alignment: .leading, spacing: 20) {
                                        HStack {
                                            Text("+1")
                                                .foregroundColor(.white)
                                                .font(Font.system(size: 30,
                                                                  weight: .medium,
                                                                  design: .rounded))
                                                .frame(height: 35)
                                            
                                            Spacer()
                                            
                                        }.padding(.leading, 5)
                                        Text("Cup")
                                            .foregroundColor(.white)
                                            .font(Font.system(size: 20, weight: .medium, design: .rounded))
                                    }.padding(.leading, 30)
                                }
                            )
                            .opacity(goalCompleted ? 1.0 : 0.5)
                    }
                    .padding(.horizontal, 30)
                    
                    CardTabView(text: "Goals", color1: Color("yellow"), color2: Color("darkYellow"), imageName: "1.circle.fill")
                        .opacity(goalCompleted ? 1.0 : 0.5)
                    
                    CardTabView(text: "Settings", color1: .gray, imageName: "gearshape.circle.fill")
                }
            }
            .toolbar { 
                ToolbarItem(placement: .navigationBarLeading) { 
                    HStack {
                        Text("betterRest")
                            .foregroundColor(.white)
                            .font(Font.system(size: 30, weight: .bold, design: .rounded))
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) { 
                    NavigationLink(destination: SettingsView()) { 
                        Image(systemName: "person.circle")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.gray)
                            .frame(width: 40, height: 40)
                    }
                }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct CardTabView: View {
    
    var text: String
    var color1: Color
    var color2: Color?
    var imageName: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .frame(height: 120)
            .overlay(
                ZStack {
                    LinearGradient(colors: [color1, color2 ?? color1], startPoint: .top, endPoint: .bottom)
                        .cornerRadius(20)
                    
                    VStack {
                        HStack(spacing: 20) {
                            Image(systemName: imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 35, height: 35)
                                .foregroundColor(.white)
                            
                            Text(text)
                                .foregroundColor(.white)
                                .font(Font.system(size: 28, weight: .semibold, design: .rounded))
                            
                            Spacer()
                        }
                        .padding(.leading, 50)
                    }
                }
            )
            .padding(.horizontal, 30)
            .shadow(color: .secondary, radius: 10, x: 2, y: 1)
    }
}
