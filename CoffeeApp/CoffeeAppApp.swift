//
//  CoffeeAppApp.swift
//  CoffeeApp
//
//  Created by apprenant1 on 26/09/2022.
//

import SwiftUI

@main
struct CoffeeAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(CoffeeViewModel())
        }
    }
}
