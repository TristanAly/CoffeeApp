//
//  CoffeeMapView.swift
//  CoffeeApp
//
//  Created by apprenant1 on 26/09/2022.
//

import SwiftUI
import MapKit

struct CoffeeMapView: View {
    
    @EnvironmentObject private var vm: CoffeeViewModel
    //    @StateObject var userLocation = UserLocation()
    
    var body: some View {
        ZStack{
            Map(coordinateRegion: $vm.mapRegion,showsUserLocation: true,userTrackingMode: .constant(.follow), annotationItems: vm.locations, annotationContent: { location in
                MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: location.lat , longitude: location.lon)) {
                    CustomAnnotation()
                        .scaleEffect(vm.mapLocation == location ? 1 : 0.7)
                        .shadow(radius: 10)
                        .onTapGesture {
                            vm.showNextLocation(location: location)
                        }
                }
            })
            .edgesIgnoringSafeArea(.all)
            VStack{
                VStack {
                    Button(action: vm.toggleLocationsList) {
                        Text(vm.mapLocation.name)
                            .font(.title2)
                            .fontWeight(.black)
                            .foregroundColor(.primary)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .animation(.none, value: vm.mapLocation)
                            .overlay(alignment: .leading) {
                                Image(systemName: "arrow.down")
                                    .font(.headline)
                                    .foregroundColor(.primary)
                                    .padding()
                                    .rotationEffect(Angle(degrees: vm.showLocationsList ? 180 : 0))
                            }
                        
                    }
                    if vm.showLocationsList {
                        ListCoffee()
                    }
                }
                .background(.thickMaterial)
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
                .padding()
                Spacer()
                
                ForEach(vm.locations) { location in
                    if vm.mapLocation == location {
                        LocationPreviewView(location: location)
                            .shadow(color: .black.opacity(0.3), radius: 20)
                            .padding()
                        //                                        .frame(maxWidth: maxWidthForIpad / 1)
                            .frame(maxWidth: .infinity)
                            .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                    }
                }
            }
        }
    }
}


struct CoffeeMapView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeMapView()
            .environmentObject(CoffeeViewModel())
    }
}

