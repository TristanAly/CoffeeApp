//
//  DetailCoffeeView.swift
//  CoffeeApp
//
//  Created by apprenant1 on 26/09/2022.
//

import SwiftUI

struct DetailCoffeeView: View {
    var coffee: CoffeeModel
    
    var body: some View {
        VStack{
            Text(coffee.name)
                .font(.largeTitle)
                .padding()
            Text(coffee.type)
                .font(.headline)
                .padding(3)
                Text(coffee.address)
                    .font(.title3)
            VStack{
                Text("En savoir plus: ")
                Text(coffee.url)
                    .foregroundColor(.blue)
            }.padding()
        }
    }
}

struct DetailCoffeeView_Previews: PreviewProvider {
    static var previews: some View {
        ListCoffee()
    }
}
