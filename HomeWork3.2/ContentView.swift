//
//  ContentView.swift
//  HomeWork3.2
//
//  Created by Artur Anissimov on 25.01.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var redSliderValue = Double.random(in: 0...255)
    @State private var greenSliderValue = Double.random(in: 0...255)
    @State private var blueSliderValue = Double.random(in: 0...255)
    
    @State private var redColor = Color.red
    @State private var greenColor = Color.green
    @State private var blueColor = Color.blue
    
    var body: some View {
        
        let viewColor = Color(red: redSliderValue / 255, green: greenSliderValue / 255, blue: blueSliderValue / 255)
        
        VStack(spacing: 20) {
            ColorView(backgroundColor: viewColor)

            ColorSliderView(value: $redSliderValue, color: $redColor)
            ColorSliderView(value: $greenSliderValue, color: $greenColor)
            ColorSliderView(value: $blueSliderValue, color: $blueColor)
            
            Spacer()
        }
        .padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ColorView: View {
    
    let backgroundColor: Color
    
    var body: some View {
        Rectangle()
            .fill(backgroundColor)
            .frame(width: 350, height: 200)
            .cornerRadius(30)
    }
}

struct ColorSliderView: View {
    
    @Binding var value: Double
    @Binding var color: Color
    
    var body: some View {
        HStack(spacing: 16) {
            Text("\(lround(value))")
                .foregroundColor(color)
                .frame(width: 35)
            Slider(value: $value, in: 0...255, step: 1)
                .tint(color)
            // TODO TextField
        }
    }
}
