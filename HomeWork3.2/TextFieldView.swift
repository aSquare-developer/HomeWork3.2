//
//  TextFieldView.swift
//  HomeWork3.2
//
//  Created by Artur Anissimov on 26.01.2022.
//

import SwiftUI

struct TextFieldView: View {
    
    @Binding var text: String // TextField text!!
    @Binding var value: Double // Slider Value!!!
    
    @State private var showAlert = false
    
    var body: some View {
        TextField("", text: $text) { _ in
            checkValue() // This Block of code call when we finish editing the text field
        }
        .frame(width: 55, alignment: .trailing)
        .multilineTextAlignment(.trailing)
        .textFieldStyle(.roundedBorder)
        .keyboardType(.decimalPad)
        .alert("Wrong Format", isPresented: $showAlert, actions: {}) {
            Text("Please enter value from 0 to 255")
        }
    }
}

extension TextFieldView {
    private func checkValue() {
        if let value = Int(text), (0...255).contains(value) {
            self.value = Double(value)
            return
        }
        showAlert.toggle()
        value = 0
        text = "0"
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray
            TextFieldView(text: .constant("128"), value: .constant(128.0))
        }
    }
}
