//
//  ListCoffee.swift
//  CoffeeApp
//
//  Created by apprenant1 on 26/09/2022.
//

import SwiftUI

struct ListCoffee: View {
    
    var vm: [CoffeeModel] = CoffeeModel.allCoffee
    
    var body: some View {
        NavigationView{
            List {
                ForEach(vm) { coffee in
                    NavigationLink(destination: DetailCoffeeView(coffee: coffee) ){
                        Text(coffee.name)
                            .font(.title3)
                    }
                }
            }
            .navigationTitle("Liste des cafés")
        }
    }
}

struct ListCoffee_Previews: PreviewProvider {
    static var previews: some View {
        ListCoffee()
    }
}
