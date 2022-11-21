//
//  CoffeeDetailView.swift
//  CoffeeApp
//
//  Created by apprenant1 on 26/09/2022.
//

import SwiftUI
import WebKit

struct CoffeeDetailView: View {
    
    @EnvironmentObject private var vm: CoffeeViewModel
    @State private var showWebView = false
    let coffee: CoffeeModel
    @State var show = false
    @Environment(\.openURL) var openURL
    
    
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
                HStack{
                    Text(coffee.type)
                        .font(.title2)
                        .bold()
                        .padding(3)
                    Spacer()
                    VStack{
                        Image(systemName: coffee.wifi ? "wifi" : "wifi.slash")
                            .font(.title2)
                        Text(coffee.wifi ? "Wifi on" : "No wifi")
                            .padding(.vertical, 5)
                    }
                    .foregroundColor(coffee.wifi ? .green : .red)
                }.padding()
                Text(coffee.address)
                    .font(.title3)
                    .frame(width: 280)
                Text("Vous souhaitez en savoir plus où réserver une place dans notre café visité le lien ci-dessous.")
                    .multilineTextAlignment(.center)
                    .padding()
            }.padding(.horizontal)
            
            HStack{
                Spacer()
                Link("Réservation", destination: URL(string: coffee.url)!)
                    .font(.title2)
                Spacer()
            }
            .padding(8)
            Spacer()
        }
    }
}

struct CoffeeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeDetailView(coffee: CoffeeModel.allCoffee.first!)
            .environmentObject(CoffeeViewModel())
    }
}
