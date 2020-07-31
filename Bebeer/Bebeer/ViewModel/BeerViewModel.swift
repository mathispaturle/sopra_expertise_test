//
//  BeerViewModel.swift
//  Bebeer
//
//  Created by Mathis Paturle on 31/07/2020.
//  Copyright © 2020 Mathis Paturle. All rights reserved.
//

import SwiftUI

let apiUrl = "https://api.punkapi.com/v2/beers?food="

class BeerViewModel: ObservableObject {
    @Published var beers: [Beer] = []
    
    //Query to API with food argument and ascending/descending ABV %
    func fetchBeers(food: String, mode: Int){
        beers.removeAll()
        
        let foodString = food.replacingOccurrences(of: " ", with: "_")
        let urlWithFood = "\(apiUrl)\(foodString)"
        guard let url = URL(string: urlWithFood) else { return }
        
        URLSession.shared.dataTask(with: url) { ( data, response, error ) in
            if let err = error {
                print(err.localizedDescription)
                return
            }
            
            guard let response = response as? HTTPURLResponse else { return }
            if response.statusCode == 200 {
                guard let data = data else { return }
                
                DispatchQueue.main.async {
                    do {
                        self.beers = try JSONDecoder().decode([Beer].self, from: data)
                    }
                    catch let err {
                        print("Error: \(err)")
                    }
                    
                    print("//BEERS RETRIEVED: \n \(self.beers)")
                }
            } else {
                print("HTTPURLResponse code: \(response.statusCode)")
            }
        }.resume()
    }
    
    
}
