//
//  ContentView.swift
//  SleepPredict
//
//  Created by Luka Vujnovac on 15.10.2021..
//

import SwiftUI

struct ContentView: View {
    
    @State private var wakeUp = Date()
    @State private var sleepAmount = 8.0 
    @State private var coffeeAmount = 0
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading, spacing: 40){
                VStack(alignment: .leading) {
                    Text("When do you wanna wake up?")
                        .font(.headline)
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                VStack(alignment:.leading) {
                    Text("desired amount of sleep")
                        .font(.headline)
                    Stepper(value: $sleepAmount, in: 4...12) { 
                        Text("\(sleepAmount, specifier: "%g") hours")
                    }
                }
                VStack(alignment: .leading) {
                    Text("daily coffe intake")
                        .font(.headline)
                    
                    Stepper(value: $coffeeAmount, in: 0...20) { 
                        if coffeeAmount == 1 {
                            Text("1 cup")
                        }else {
                            Text("\(coffeeAmount) cups")
                        }
                    }
                }
            }
            .padding()
            .navigationTitle("SleepPredict")
            .navigationBarItems( trailing:
                Button(action: calculateBedTime, label: { 
                    Text("Calculate")
            })                 
            )
            .alert(isPresented: $showingAlert) { 
                Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
