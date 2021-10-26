//
//  ContentView.swift
//  sui_pizza
//
//  Created by Denis Schüle on 26.10.21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var pizza = Pizza()
    
    @State var showingConfirmation = false
    var body: some View {
        
        NavigationView{
            Form{
                Section {
                    Picker("Chose your pizza",selection: $pizza.pizzaTypeIndex) {
                        ForEach(0..<Pizza.pizzaTypes.count){index in
                            Text(Pizza.pizzaTypes[index]).tag(index)
                        }
                    }
                    Stepper(value: $pizza.amount, in: 1...10) {
                        Text("Pizza amount:  \(pizza.amount)")
                    }
                }
                Section {
                    Picker("",selection: $pizza.pizzaSizeIndex) {
                        ForEach(0..<Pizza.pizzaSizes.count){ index in
                            Text(Pizza.pizzaSizes[index]).tag(index)

                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Delivery")) {
                    TextField("Name", text: $pizza.adressName)
                    TextField("Street", text: $pizza.adressStreet)
                    TextField("City", text: $pizza.adressCity)
                    TextField("ZipCode", text: $pizza.adressZipCode)
                        .keyboardType(.numberPad)
                }
                Section {
                    Button(action: {showingConfirmation = true}) {
                        Text("Kostenpflichtig bestellen")
                    }.disabled(pizza.orderIsInvalid)
                }
               
            }
            .navigationBarTitle("Pizza Order")
            .alert(isPresented: $showingConfirmation) {
                Alert(title: Text("Summary of your order"), message:
                        Text("Your order \(pizza.amount) x \(Pizza.pizzaTypes[pizza.pizzaTypeIndex]) in the size: \(Pizza.pizzaSizes[pizza.pizzaSizeIndex])"), dismissButton: .cancel(Text("confirm"), action: {
                    pizza.resetForm()
                }))
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
