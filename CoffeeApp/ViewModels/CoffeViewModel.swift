//
//  CoffeViewModel.swift
//  CoffeeApp
//
//  Created by apprenant1 on 26/09/2022.
//

import Foundation
import MapKit
import SwiftUI

class CoffeeViewModel: ObservableObject {
    
    // All loaded locations
    @Published var locations: [CoffeeModel]
    
    // Current Location on map
    @Published var mapLocation: CoffeeModel {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    // Show list of locations
        @Published var showLocationsList: Bool = false
        
        // Show location detail via sheet
        @Published var sheetLocation: CoffeeModel? = nil
    
    init() {
        let locations = CoffeeModel.allCoffee
            self.locations = locations
            self.mapLocation = locations.first!
            
            self.updateMapRegion(location: locations.first!)
        }
    
    // Current region on map
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)

    private func updateMapRegion(location: CoffeeModel) {
            withAnimation(.easeInOut) {
                mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: location.lat, longitude: location.lon), span: mapSpan)
            }
  }
    func toggleLocationsList() {
            withAnimation(.easeInOut) {
                showLocationsList = !showLocationsList
              
            }
        }
        
        func showNextLocation(location: CoffeeModel) {
            withAnimation(.easeInOut) {
                mapLocation = location
                showLocationsList = false
            }
        }
        func nextButtonPress() {
            
            // Get the current Index
            guard let currentIndex = locations.firstIndex(where: { $0 == mapLocation }) else {
                print("Could not find current index in locations array! Should never happen.")
                return
            }
            
            // Check if the currentIndex is valid
            let nextIndex = currentIndex + 1
            guard locations.indices.contains(nextIndex) else {
                
                // Next index is Not Valid
                // Restart from 0
                guard let firstLocation = locations.first else { return }
                showNextLocation(location: firstLocation )
                return
            }
            
            // Next index IS valid
            let nextLocation = locations[nextIndex]
            showNextLocation(location: nextLocation)
            
        }
}
