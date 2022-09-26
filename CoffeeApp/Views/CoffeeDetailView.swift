//
//  CoffeeDetailView.swift
//  CoffeeApp
//
//  Created by apprenant1 on 26/09/2022.
//

import SwiftUI

struct CoffeeDetailView: View {
    @EnvironmentObject private var vm: CoffeeViewModel
    let coffee: CoffeeModel
    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            Text(coffee.name)
                .font(.largeTitle)
                .bold()
                .foregroundColor(.blue.opacity(0.8))
                .padding()
            Image("test")
                .resizable()
                .frame(width: 400,height: 300)
            VStack(alignment: .leading){
                Text(coffee.type)
                    .font(.title2)
                    .bold()
                    .padding(3)
                Text(coffee.address)
                    .font(.title3)
            }.padding(.horizontal)
            HStack{
                Spacer()
                if let url = URL(string: coffee.url) {
                               Link("En savoir plus: ", destination: url)
                                   .font(.headline)
                                   .tint(.blue)
                           }
                 Spacer()
            }
            .padding()
        }
    }
}

struct CoffeeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeDetailView(coffee: CoffeeModel.allCoffee.first!)
            .environmentObject(CoffeeViewModel())
    }
}
