//
//  ContentView.swift
//  BMICalculator
//
//  Created by EMRE ÇOBAN on 8.01.2026.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = BMIViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Kilonuz (kg)", value: $viewModel.weight, format: .number)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                
                TextField("Boyunuz (m)", value: $viewModel.height, format: .number)
                    .textFieldStyle(.roundedBorder)
                    .padding()
            }
            .navigationTitle("BMI Calculator")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
