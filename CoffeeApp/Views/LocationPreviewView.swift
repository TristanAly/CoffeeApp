//
//  LocationPreviewView.swift
//  CoffeeApp
//
//  Created by apprenant1 on 26/09/2022.
//

import SwiftUI

struct LocationPreviewView: View {
    
    @EnvironmentObject private var vm: CoffeeViewModel
    var location: CoffeeModel
    
    var body: some View {
            VStack{
                Text(location.name)
                Text(location.address)
            
                HStack{
                    learnMoreButton
                    nextButton
                }
        }
            .padding()
            .background(.thinMaterial)
            .cornerRadius(10)
            .sheet(item: $vm.sheetLocation, onDismiss: nil) { coffee in
               CoffeeDetailView(coffee: coffee)
                
            }
    }
}

struct LocationPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        LocationPreviewView(location: CoffeeModel.allCoffee.first!)
            .environmentObject(CoffeeViewModel())
    }
}

extension LocationPreviewView {
    
    private var learnMoreButton: some View {
        Button {
            vm.sheetLocation = location
        } label: {
            Text("Lear more")
                .font(.headline)
                .frame(width: 125, height: 35)
        }
        .buttonStyle(.borderedProminent)
       
    }
        private var nextButton: some View {
            Button {
                vm.nextButtonPress()
            } label: {
                Text("Next")
                    .font(.headline)
                    .frame(width: 125, height: 35)
            }
            .buttonStyle(.bordered)
            
        }
}
