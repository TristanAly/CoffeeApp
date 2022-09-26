//
//  CoffeeModel.swift
//  CoffeeApp
//
//  Created by apprenant1 on 26/09/2022.
//

import Foundation

struct CoffeeModel: Identifiable, Codable  {
    var id: Int
    var name: String
    var lat: Double
    var lon: Double
    var address: String
    var type: String
    var url: String
    var wifi: Bool
    
    static let allCoffee: [CoffeeModel] = Bundle.main.decode(file: "places.json")
//    static let newCoffee: CoffeeModel = allCoffee[0]
}

//enum TypeEnum: Codable{
//    case coffee
//    case coffeeCoworking
//    case coworking
//}
extension Bundle {
    
func decode<T: Decodable>(file: String) -> T {
   guard let url = self.url(forResource: file, withExtension: nil) else {
       fatalError("Could not find \(file) in the project!")
   }
   guard let data = try? Data(contentsOf: url) else {
       fatalError("Could not load \(file) in the project!")
   }
   let decoder = JSONDecoder()

   guard let loadedData = try? decoder.decode(T.self, from: data) else {
       fatalError("Could not decode \(file) in the project!")
   }
   return loadedData
}
}

