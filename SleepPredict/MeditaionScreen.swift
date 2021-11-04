//
//  Home.swift
//  SleepPredict
//
//  Created by Luka Vujnovac on 29.10.2021..
//

import SwiftUI

struct MeditaionScreen: View {
    
    @State private var waterAmount: Float = 0
    @State private var showingAlert: Bool = false
    
    var body: some View {
        NavigationView{
            ZStack{
                BackgroundView()
                
                VStack(spacing: 20){
                    personView.overlay(overlayView.mask(personView))
                        .shadow(color: .black, radius: 10, x: 2, y: 1)
                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                waterAmount = waterAmount + 0.25   
                            }
                            
                            if waterAmount == 2 {
                                showingAlert = true
                            }
                        }
                    HStack {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(height: 40, alignment: .center)
                            .shadow(radius: 10)
                            .foregroundColor(.white)
                            .overlay(
                                Text("meditaion")
                                    .fontWeight(.semibold)
                                    .font(Font.system(size: 17))
                                    .foregroundColor(.purple)
                            )
                        RoundedRectangle(cornerRadius: 20)
                            .frame(height: 40, alignment: .center)
                            .shadow(radius: 10)
                            .foregroundColor(.white)
                            .overlay(
                                Text("hydration")
                                    .fontWeight(.semibold)
                                    .font(Font.system(size: 17))
                                    .foregroundColor(.purple)
                            )
                        
                        NavigationLink { 
                            SleepView()
                        } label: { 
                            RoundedRectangle(cornerRadius: 20)
                                .frame(height: 40, alignment: .center)
                                .shadow(radius: 10)
                                .foregroundColor(.white)
                                .overlay(
                                    Text("sleep")
                                        .fontWeight(.semibold)
                                        .font(Font.system(size: 17))
                                        .foregroundColor(.purple)
                                )
                        }
                    
                    }.padding(.bottom, 50)
                        .padding(.horizontal, 10)
                    
                    Spacer()
                }
            }
            .alert(isPresented: $showingAlert) { 
                Alert(title: Text("Congratualtions"), message: Text("You have met your water goal for the day!"), dismissButton: .default(Text("OK")))
            }
        }
    }
    
    private var personView: some View {
        Image("figure")
            .renderingMode(.template)
            .resizable()
            .foregroundColor(.white)
            .frame(width: UIScreen.main.bounds.width / 2  , height: UIScreen.main.bounds.height / 2, alignment: .center)
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

struct MeditationScreen_Previews: PreviewProvider {
    static var previews: some View {
        MeditaionScreen()
    }
}

