//
//  Home.swift
//  SleepPredict
//
//  Created by Luka Vujnovac on 04.11.2021..
//

import SwiftUI

struct Home: View {
    
    @State private var scaleEffect: CGFloat = 1
    @State private var waterAmount: Float = 0
    @State private var waterGoalMet: Bool = false
    
    var body: some View {
        ZStack {
            BackgroundView()
            VStack{
                Image(systemName: "moon.zzz")
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(scaleEffect)
                    .foregroundColor(Color("gold"))
                    .frame(width: 100, height: 100)
                    .padding(.vertical, 50)
                    .onAppear { 
                        let baseAnimation = Animation.easeInOut(duration: 1)
                        let repeated = baseAnimation.repeatForever(autoreverses: true)
                        
                        withAnimation(repeated) {
                            scaleEffect = 1.1
                        }
                    }
                
                VStack(spacing: 30){
                    HStack(spacing: 30){
                        RoundedRectangle(cornerRadius: 50)
                            .frame(width: 160, height: 190)
                            .foregroundColor(waterGoalMet ? Color("gold") : Color("softWhite"))
                            .shadow(color: .black, radius: 10, x: 1, y: 2)
                            .overlay(
                                VStack(spacing: 30){
                                    
                                    HStack {
                                        Text("Water")
                                            .font(Font.system(size: 15))
                                            .fontWeight(.semibold)
                                        
                                        Text("\(String(waterAmount)) L")
                                            .font(Font.system(size: 15))
                                            .fontWeight(.light)
                                    }
                                    
                                    personView.overlay(overlayView.mask(personView))
                                }
                            )
                            .onTapGesture {
                                withAnimation(.easeInOut) {
                                    waterAmount += 0.25   
                                    if waterAmount >= 2 {
                                        waterGoalMet = true
                                    }
                                }
                            }
                        
                        RoundedRectangle(cornerRadius: 50)
                            .frame(width: 160, height: 190)
                            .foregroundColor(Color("softWhite"))
                            .shadow(color: .black, radius: 10, x: 1, y: 2)
                            .overlay(
                                VStack(spacing: 30) {
                                    Text("Meditaion")
                                        .font(Font.system(size: 15))
                                        .fontWeight(.semibold)
                                    
                                    Image("meditation")
                                        .renderingMode(.template)
                                        .resizable()
                                        .foregroundColor(.gray )
                                        .frame(width: 80, height: 80)
                                }
                            )
                    }
                    
                    HStack(spacing: 30){
                        RoundedRectangle(cornerRadius: 50)
                            .frame(width: 160, height: 190)
                            .foregroundColor(Color("softWhite"))
                            .shadow(color: .black, radius: 10, x: 1, y: 2)
                            .overlay(
                                VStack(spacing: 30) {
                                    
                                    Text("Sleep")
                                        .font(Font.system(size: 15))
                                        .fontWeight(.semibold)
                                    
                                    Image(systemName: "sleep")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 80, height: 80)
                                        .foregroundColor(.gray)
                                }
                            )
                        
                        RoundedRectangle(cornerRadius: 50)
                            .frame(width: 160, height: 190)
                            .foregroundColor(Color("softWhite"))
                            .shadow(color: .black, radius: 10, x: 1, y: 2)
                            .overlay(
                                VStack(spacing: 30) {
                                    Text("Profile")
                                        .font(Font.system(size: 15))
                                        .fontWeight(.semibold)
                                    Image(systemName: "person")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 80, height: 80)
                                        .foregroundColor(.gray)
                                }
                            )
                    }
                }
            }
        }
    }
    
    private var personView: some View {
        Image(systemName: "figure.stand")
            .resizable()
            .scaledToFit()
            .foregroundColor(.gray)
            .frame(width: 80, height: 80, alignment: .center)
    }
    
    private var overlayView: some View {
        GeometryReader {geometry in 
            ZStack(alignment: .bottom) { 
                Rectangle()
                    .foregroundColor(.blue)
                    .frame(height: CGFloat(waterAmount) / 2 * geometry.size.height)
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
