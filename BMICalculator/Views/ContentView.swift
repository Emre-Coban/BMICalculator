//
//  ContentView.swift
//  BMICalculator
//
//  Created by EMRE ÇOBAN on 8.01.2026.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = BMIViewModel()
    
    @FocusState private var isInputFocused: Bool
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                TextField("Kilonuz (kg)", value: $viewModel.weight, format: .number)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.decimalPad) // Sadece sayı klavyesi açar
                    .focused($isInputFocused)
                    .padding()
                
                TextField("Boyunuz (m)", value: $viewModel.height, format: .number)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.decimalPad)
                    .focused($isInputFocused)
                    .padding()
                
                Button("Calculate") {
                    
                    viewModel.calculatedBMI()
                    
                }
                .buttonStyle(.borderedProminent) // Butonu mavi ve dolgulu yapar
                
                Text("Result: \(String(format: "%.2f", viewModel.bmi))")
                    .font(.title)
                    .fontWeight(.bold)
                    .opacity(viewModel.bmi > 0 ? 1 : 0) // Eğer sonuç 0 ise yazı gizlenir
            }
            .navigationTitle("BMI Calculator")
            .navigationBarTitleDisplayMode(.inline)
            // Klavyenin üzerine "Done" butonu ekler
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer() // butonu en sağa iter
                    Button("Done") {
                        isInputFocused = false
                    }
                }
            }
            // Bu kod boş alanlarında "tıklanabilir" olmasını sağlar.
            .contentShape(Rectangle())
            
            // Boşluğa tıklayınca klavyeyi kapatır
            .onTapGesture {
                isInputFocused = false
            }
        }
    }
}

#Preview {
    ContentView()
}
