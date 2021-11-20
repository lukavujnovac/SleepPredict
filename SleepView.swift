//
//  ContentView.swift
//  SleepPredict
//
//  Created by Luka Vujnovac on 15.10.2021..
//

import SwiftUI

struct SleepView: View {
    
    @State private var wakeUp = Date()
    @State private var sleepAmount = 8.0 
    @State private var coffeeAmount = 0
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    @State private var scale: CGFloat = 1
    
    var body: some View {
        NavigationView{
            ZStack{
//                BackgroundView()
                VStack(spacing: 50) {
//                    moonView
//                        .scaleEffect(scale)
//                        .onAppear { 
//                            let baseAnimation = Animation.easeInOut(duration: 1)
//                            let repeated = baseAnimation.repeatForever(autoreverses: true)
//                            
//                            withAnimation(repeated) {
//                                scale = 1.1
//                            }
//                        }
                    
                    VStack(alignment: .leading, spacing: 40){
                        VStack(alignment: .leading) {
                            Text("When do you wanna wake up?")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                                .labelsHidden()
                                .background(Color.white)
                                .cornerRadius(15)
                        }
                        VStack(alignment:.leading) {
                            Text("desired amount of sleep")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            Stepper(value: $sleepAmount, in: 4...12) { 
                                Text("\(sleepAmount, specifier: "%g") hours")
                                    .foregroundColor(.white)
                                    .fontWeight(.light)
                            }
                        }
                        VStack(alignment: .leading) {
                            Text("daily coffe intake")
                                .font(.headline)
                                .foregroundColor(.white)
                            
                            Stepper(value: $coffeeAmount, in: 0...20) { 
                                if coffeeAmount == 1 {
                                    Text("1 cup")
                                        .fontWeight(.light)
                                }else {
                                    Text("\(coffeeAmount) cups")
                                        .fontWeight(.light)
                                }
                            }
                            .foregroundColor(.white)
                        }
                    }
                    .padding()
                    
                    Button(action: calculateBedTime, label: { 
                        RoundedRectangle(cornerRadius: 25)
                            .frame(width: 120, height: 40, alignment: .center)
                            .foregroundColor(.white)
                            .shadow(color: .black, radius: 10, x: 1, y: 2)
                            .overlay(
                                Text("Calculate")
                                    .foregroundColor(Color("darkPurple"))
                                    .fontWeight(.bold)
                            )
                    })
                    
                    Spacer()
                }
                .alert(isPresented: $showingAlert) { 
                    Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                }
            }   
        }
    }
    func calculateBedTime() {
        let model = SleepCalculator()
        
        let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
        let hour = (components.hour ?? 0 ) * 60 * 60
        let minute = (components.minute ?? 0) * 60
        
        do {
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            
            alertMessage = formatter.string(from: sleepTime)
            alertTitle = "your ideal bedtime is..."
        }catch{
            alertTitle = "Error"
            alertMessage = "Sorry there was a problem calculating your bedtime."
        }
        
        showingAlert = true
    }
    
    private var moonView: some View {
        Image(systemName: "moon.zzz.fill")
            .resizable()
            .frame(width: 200, height: 200)
            .foregroundColor(.white)
            .shadow(color: .black, radius: 10, x: 1, y: 2)
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        SleepView()
//    }
//}
