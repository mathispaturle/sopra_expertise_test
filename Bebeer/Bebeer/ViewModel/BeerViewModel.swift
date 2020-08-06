//
//  BeerViewModel.swift
//  Bebeer
//
//  Created by Mathis Paturle on 31/07/2020.
//  Copyright © 2020 Mathis Paturle. All rights reserved.
//

import SwiftUI

//API URL for punkapi
let apiUrl = "https://api.punkapi.com/v2/beers?food="

class BeerViewModel: ObservableObject, Identifiable {
    
    //Array of beer model
    @Published var beers: [Beer] = []
    
    //Fetch data from API with food argument and ascending ABV %
    func fetchBeers(food: String){
        
        beers.removeAll()
        
        //Replace the blank spaces with underscore as stated in punkapi
        let foodString = food.replacingOccurrences(of: " ", with: "_")

        let defaults = UserDefaults.standard
        
        //Checks if already downloaded a JSON file that matches the search term
        let json = defaults.data(forKey: foodString)
        
        //If a file with a matching key with the search term is found, retrieve
        //data form local JSON file
        //CAUTION: if API is dynamic and constantly updated, retrieving
        //the local json will avoid downloading new changes in the API Database
        if json != nil {
            
            //Asyn operation to parse JSON file to beer model array
            DispatchQueue.main.async {
                do {
                    self.beers = try JSONDecoder().decode([Beer].self, from: json!)
                }
                catch let err {
                    print("Error: \(err)")
                }
                
                //Initial sorting in ascending ABV %
                self.beers.sort {
                    $0.abv < $1.abv
                }
            }
        }
            
        //If not already downloaded launch REST request
        else
        {
            //Create search query to API
            let urlWithFood = "\(apiUrl)\(foodString)"
            guard let url = URL(string: urlWithFood) else { return }
                    
            //Retrieve the information with the associated url
            URLSession.shared.dataTask(with: url) { ( data, response, error ) in
                
                //An error is encountered and printed
                if let err = error {
                    print(err.localizedDescription)
                    //TODO: Alert and dismiss view
                    
                    return
                }
                
                guard let response = response as? HTTPURLResponse else { return }
                
                //If status code is 200 -> request fulfilled correctly (OK)
                //proceed with extraction of the information in the response.data
                if response.statusCode == 200 {
                    guard let data = data else { return }
                    
                    //Asyn operation to parse JSON file to beer model array
                    DispatchQueue.main.async {
                        do {
                            self.beers = try JSONDecoder().decode([Beer].self, from: data)
                            
                            //Save file to UserDefaults
                            UserDefaults.standard.set(data, forKey: foodString)

                        }
                        catch let err {
                            print("Error: \(err)")
                        }
                        
                        //Initial sorting in ascending ABV %
                        self.beers.sort {
                            $0.abv < $1.abv
                        }
                    }
                }
                //Status code is not OK, print out response code
                else {
                    print("HTTPURLResponse code: \(response.statusCode)")
                    
                    //TODO: Launch alert and dismiss view
                    
                }
            }.resume()
        }
    }
    
    //Function that sorts the array in ascending ABV%
    func ascendingABV() {
        self.beers.sort {
            $0.abv < $1.abv
        }
    }
    
    //Function that sorts the array in descending ABV%
    func descendingABV() {
        self.beers.sort {
            $0.abv > $1.abv
        }
    }
    
    
}
