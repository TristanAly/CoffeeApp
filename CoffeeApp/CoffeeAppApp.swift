//
//  CoffeeAppApp.swift
//  CoffeeApp
//
//  Created by apprenant1 on 26/09/2022.
//

import SwiftUI

@main
struct CoffeeAppApp: App {
    
    @StateObject private var vm = CoffeeViewModel()
    
    var body: some Scene {
        WindowGroup {
            CoffeeMapView()
                .environmentObject(vm)
        }
    }
}
