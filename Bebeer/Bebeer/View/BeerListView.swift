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
//        LoadingView(isShowing: .constant(beerViewModel.beers.isEmpty)) {
//              ...replace with code from below
//        }
        
        NavigationView {
            List(self.beerViewModel.beers) { beer in
                NavigationLink(destination: BeerView(beer: beer)) {
                    BeerRowView(beer: beer)
                }
            }.onAppear(){
                if (self.beerViewModel.beers.isEmpty){
                    self.beerViewModel.fetchBeers(food: self.foodString)
                }
                UITableView.appearance().separatorStyle = .none
                }.navigationBarTitle("")
            .navigationBarHidden(true).foregroundColor(Color(UIColor.FlatColor.Yellow.Turbo))
        
        }
    }
}

struct BeerListView_Previews: PreviewProvider {
    static var previews: some View {
        BeerListView()
    }
}
