//
//  BeerListView.swift
//  Bebeer
//
//  Created by Mathis Paturle on 01/08/2020.
//  Copyright © 2020 Mathis Paturle. All rights reserved.
//

import SwiftUI

struct BeerListView: View {
    
    //String of food written by user
    @State var foodString = "Food"
    
    //Beers View Model
    @ObservedObject var beerViewModel = BeerViewModel()
    
    
    var body: some View {
        
        List(beerViewModel.beers) { beer in
            BeerRowView(beer: beer)
        }.onAppear(){
            self.beerViewModel.fetchBeers(food: self.foodString)
        }
        
//        List(beerViewModel.beers, id: \.self) { beer in
//            Text("Hello World")
//            Text(beer)
//
//        }.onAppear(){
//            self.beerViewModel.fetchBeers(food: self.foodString)
//        }
        
        
//        LoadingView(isShowing: .constant(beerViewModel.$beers.count() != 0)) {
//            NavigationView {
//                List(["1", "2", "3", "4", "5"], id: \.self) { row in
//                    Text(row)
//                }.navigationBarTitle(Text("A List"), displayMode: .large)
//            }
//        }
        
        
//        NavigationView {
//            List {
//                Text("Hello World")
//                Text("Hello World")
//                Text("Hello World")
//            }.navigationBarTitle(self.foodString)
//        }
    }
}

struct BeerListView_Previews: PreviewProvider {
    static var previews: some View {
        BeerListView()
    }
}
