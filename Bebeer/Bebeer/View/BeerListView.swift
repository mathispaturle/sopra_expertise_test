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
        
    //Segmented control
    @State private var selection = 0
    @State private var previous: Int = 0
    private let items: [String] = ["Lower ABV%", "Higher ABV%"]
   
    
    var body: some View {
//        LoadingView(isShowing: .constant(beerViewModel.beers.isEmpty)) {
//              ...replace with code from below
//        }
        
        NavigationView {
            VStack {
                VStack {
                    Picker(selection: $selection, label: Text("")) {
                        ForEach(0..<items.count, id: \.self) { index in
                            Text(self.items[index]).tag(index)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                        .onAppear(){
                            UISegmentedControl.appearance().selectedSegmentTintColor = UIColor.FlatColor.Violet.BlueGem
                            UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
                            UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.FlatColor.Violet.BlueGem], for: .normal)
                    }.onReceive([self.selection].publisher.first()) { (value) in
                            print(self.selection)
                        if (self.selection == 0 && self.selection != self.previous){
                            self.beerViewModel.ascendingABV()
                            self.previous = 0
                        }
                        else if (self.selection == 1 && self.selection != self.previous) {
                            self.beerViewModel.descendingABV()
                            self.previous = 1
                        }
                        
                    }
                }
                
                List(self.beerViewModel.beers) { beer in
                    NavigationLink(destination: BeerView(beer: beer)) {
                        BeerRowView(beer: beer)
                    }
                }.onAppear(){
                    if (self.beerViewModel.beers.isEmpty){
                        self.beerViewModel.fetchBeers(food: self.foodString)
                    }
                        UITableView.appearance().separatorStyle = .none
                }.navigationBarTitle(self.foodString)
            }
        }
    }
}

struct BeerListView_Previews: PreviewProvider {
    static var previews: some View {
        BeerListView()
    }
}

struct TabItem: View {
    let text: String
    let tag: Int

    var body: some View {
//        Image(systemName: image).tag(tag)
        Text(text)
    }
}
