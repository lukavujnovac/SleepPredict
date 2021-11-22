//
//  HydrationView.swift
//  SleepPredict
//
//  Created by Luka Vujnovac on 22.11.2021..
//

import SwiftUI

struct HydrationView: View {
    
    @State private var drankToday: Double = 0
    private var waterGoal: Double = 2
    @State private var goalHit: Bool = false
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.black)
                .ignoresSafeArea()
            
            VStack{
                personView
                    .overlay(overlayView.mask(personView))
                
                HStack {
                    Text("drank today:")
                        .foregroundColor(goalHit ? .blue : .white)
                        .font(Font.system(size: 20, weight: .semibold, design: .rounded))
                    
                    Text(String(format: "%.2f", drankToday))
                        .foregroundColor(goalHit ? .blue : .white)
                        .font(Font.system(size: 20, weight: .semibold, design: .rounded))
                }
                
                    
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
