//
//  HydrationView.swift
//  SleepPredict
//
//  Created by Luka Vujnovac on 22.11.2021..
//

import SwiftUI

struct HydrationView: View {
    
    @State private var drankToday: Double = 0
    @State private var waterGoal: Double = 2
    @State private var goalHit: Bool = false
    @State private var wakeUpTime: Date = Date()
    @State private var sleepTime: Date = Date()
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.black)
                .ignoresSafeArea()
            
            VStack(spacing: 30){
                DatePicker("What time do you wake up?", selection: $wakeUpTime, displayedComponents: .hourAndMinute)
                    .frame(height: 60)
                    .padding(.horizontal, 20)
                    .background(Color("lightPurple"))
                    .cornerRadius(20)
                    .padding()
                
                DatePicker("What time do you go to sleep?", selection: $sleepTime, displayedComponents: .hourAndMinute)
                    .frame(height: 60)
                    .padding(.horizontal, 20)
                    .background(Color("lightPurple"))
                    .cornerRadius(20)
                    .padding()
                
                VStack(alignment:.leading, spacing: 10) {
                    Text("how much water you want to drink per day?")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Stepper(value: $waterGoal, in: 0...10) { 
                        Text("\(waterGoal, specifier: "%g") liters")
                            .foregroundColor(.white)
                            .fontWeight(.light)
                    }
                    .frame(height: 60)
                    .padding(.horizontal, 20)
                    .background(Color("lightPurple"))
                    .cornerRadius(20)
                }.padding(.horizontal, 20)
                
                personView
                    .overlay(overlayView.mask(personView))
                    .padding(.top, 50)
                
                HStack {
                    Text("drank today:")
                        .foregroundColor(goalHit ? .blue : .white)
                        .font(Font.system(size: 20, weight: .semibold, design: .rounded))
                    
                    Text(String(format: "%.2f", drankToday))
                        .foregroundColor(goalHit ? .blue : .white)
                        .font(Font.system(size: 20, weight: .semibold, design: .rounded))
                }
                
                Spacer()
                
                
            }
        }
    }
    
    private var personView: some View {
        Image(systemName: "figure.stand")
            .resizable()
            .scaledToFit()
            .foregroundColor(.white)
            .frame(height: 200)
            .onTapGesture {
                withAnimation(.easeInOut) {
                    drankToday += 0.25
                    if drankToday >= waterGoal {
                        goalHit = true
                    }
                }
            }
    }
    
    private var overlayView: some View {
        GeometryReader {geometry in 
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(.blue)
                    .frame(height: CGFloat(drankToday) / waterGoal * geometry.size.height)
            }
        }.allowsHitTesting(false)
    }
}

struct HydrationView_Previews: PreviewProvider {
    static var previews: some View {
        HydrationView()
    }
}
