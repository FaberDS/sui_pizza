//
//  Pizza.swift
//  sui_pizza
//
//  Created by Denis Schüle on 26.10.21.
//

import Foundation


class Pizza :ObservableObject {
    static let pizzaTypes : [String] = ["Magarita", "Fungi", "Frutti di Mare", "Salami", "Proscuitto"]
    static let pizzaSizes : [String] = ["Small", "Medium", "Large"]
    @Published var pizzaTypeIndex = 0
    @Published var amount = 1
    @Published var pizzaSizeIndex = 0
    @Published var adressName = ""
    @Published var adressStreet = ""
    @Published var adressCity = ""
    @Published var adressZipCode = ""
    
    var orderIsInvalid : Bool  {
         return adressName.isEmpty || adressStreet.isEmpty || adressCity.isEmpty || adressZipCode.isEmpty
    }
    func resetForm(){
        amount = 1
        pizzaTypeIndex = 0
        pizzaSizeIndex = 0
        adressName = ""
        adressStreet = ""
        adressCity = ""
        adressZipCode = ""
    }
}
