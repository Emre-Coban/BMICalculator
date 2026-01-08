//
//  BMIViewModel.swift
//  BMICalculator
//
//  Created by EMRE ÇOBAN on 8.01.2026.
//


internal import Combine


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
}
