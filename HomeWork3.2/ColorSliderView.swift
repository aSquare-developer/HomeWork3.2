//
//  ColorSliderView.swift
//  HomeWork3.2
//
//  Created by Artur Anissimov on 26.01.2022.
//

import SwiftUI

struct ColorSliderView: View {
    
    @Binding var value: Double
    @State private var text = ""
    
    let color: Color
    
    var body: some View {
        HStack {
            TextView(value: value)
            
            Slider(value: $value, in: 0...255, step: 1)
                .accentColor(color)
                .onChange(of: value) { newValue in // Passing a slider value to textfield
                    text = "\(lround(newValue))"
                }
            
            TextFieldView(text: $text, value: $value)
        }
        .onAppear {
            text = "\(lround(value))"
        }
    }
}

struct ColorSliderView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            ColorSliderView(value: .constant(100), color: .red)
        }
    }
}
