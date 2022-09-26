//
//  ListCoffee.swift
//  CoffeeApp
//
//  Created by apprenant1 on 26/09/2022.
//

import SwiftUI

struct ListCoffee: View {
    
    @EnvironmentObject var vm:  CoffeeViewModel
    
    var body: some View {
        NavigationView{
            List {
                ForEach(vm.locations) { coffee in
                    Button {
                        vm.showNextLocation(location: coffee)
                    } label: {
                        Text(coffee.name)
                            .font(.title2)
                    }
                }
            }
            .listStyle(.plain)
        }
    }
}

struct ListCoffee_Previews: PreviewProvider {
    static var previews: some View {
        ListCoffee()
            .environmentObject(CoffeeViewModel())
    }
}

extension ListCoffee {
    
   private func listRowView(location: CoffeeModel) -> some View {
            
            VStack(alignment: .leading){
                Text(location.name)
                    .font(.headline)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

