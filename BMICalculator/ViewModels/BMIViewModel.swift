//
//  BMIViewModel.swift
//  BMICalculator
//
//  Created by EMRE ÇOBAN on 8.01.2026.
//


import Combine
import SwiftUI

class BMIViewModel: ObservableObject {
    
    // Kullanıcıdan alacağımız veriler (Değişince ekran güncellensin diye @Published)
    @Published var height: Double = 0 // Boy
    @Published var weight: Double = 0 // Kilo
    @Published var bmi: Double = 0 // Sonuç
    
    
    //Hesaplama Fonksiyonu (Locig)
    func calculatedBMI() {
        //Matematiksel formül: kilo / (boy * boy)
        //Kullanıcı boyu "0" girerse uygulama çökmesin diye kontrol ediyoruz.
        if height > 0 {
            bmi = weight / (height * height)
        } else {
            bmi = 0
        }
    }
    
    // BMI değerine göre durumu metin olarak döndürür
    var bmiStatus: String {
        if bmi == 0 { return "" } // Başlangıçta boş
        else if bmi < 18.5 { return "Zayıf" }
        else if bmi < 25 { return "Normal" }
        else if bmi < 30 { return "Fazla Kilolu" }
        else { return "Obez" }
    }
    
    
    // BMI değerine göre rengi döndürür
    var bmiColor: Color {
        if bmi == 0 { return .black }
        else if bmi < 18.5 { return .blue }
        else if bmi < 25 { return .green }
        else if bmi < 30 { return .orange }
        else { return .red }
    }
}
