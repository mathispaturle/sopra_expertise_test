//
//  ContentView.swift
//  Bebeer
//
//  Created by Mathis Paturle on 30/07/2020.
//  Copyright © 2020 Mathis Paturle. All rights reserved.
//

import SwiftUI

struct Home: View {
    
    @ObservedObject var beerViewModel = BeerViewModel()
    
    @State private var searchText = ""
    @State private var showConfirmButton: Bool = false
    
    @State private var selection = 0
    private let items: [String] = ["Higher ABV %", "Lower ABV %"]

    var body: some View {
       
        ZStack(alignment: .topLeading) {
            Rectangle().foregroundColor(Color.init(red: 246/255, green: 185/255, blue: 59/255))
                .edgesIgnoringSafeArea(.top)
                .edgesIgnoringSafeArea(.bottom)
            
            VStack(alignment: .leading, spacing: 8){
                
                Text("Welcome to BeBeer").bold()
                    .font(.callout)
                    .foregroundColor(Color.init(red: 7/255, green: 153/255, blue: 146/255))

                // Search view
                HStack {
                    HStack (alignment: .center) {
                        
                        TextField("", text: $searchText, onEditingChanged: { (changing) in
                            //print("Changing: \(changing)")
                        }, onCommit: {
                            //print(self.searchText)
                            
                            //Perform query
                            self.beerViewModel.fetchBeers(food: self.searchText, mode: self.selection)
                            
                        }).placeHolder(Text("Find your beer").bold()
                            .foregroundColor(.white)
                            .font(.largeTitle), show: searchText.isEmpty)
                            .foregroundColor(.white)
                            .font(Font.largeTitle.weight(.bold))
                            .accentColor(Color.init(red: 7/255, green: 153/255, blue: 146/255))
                        
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                        
                        Button(action: {
                            self.searchText = ""
                        }) {
                            Image(systemName: "xmark.circle.fill").opacity(searchText == "" ? 0 : 1)
                        }
                    }
                    .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
                    .foregroundColor(.secondary)

                    if showConfirmButton {
                        Button("Search") {
                            UIApplication.shared.endReceivingRemoteControlEvents()
                            self.searchText = ""
                            self.showConfirmButton = false
                        }
                        .foregroundColor(Color(.systemBlue))
                    }
                }
                .navigationBarHidden(showConfirmButton)

                VStack {
                    Picker(selection: $selection, label: Text("")) {
                        ForEach(0..<items.count, id: \.self) { index in
                            Text(self.items[index]).tag(index)
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                
                Spacer()
                VStack (alignment: .leading){
                    Text("App created by Mathis Paturle").foregroundColor(.white)
                }.edgesIgnoringSafeArea(.bottom)

            }.padding(32)
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct PlaceHolder<T: View>: ViewModifier {
    var placeHolder: T
    var show: Bool
    func body(content: Content) -> some View {
        ZStack(alignment: .leading) {
            if show { placeHolder }
            content
        }
    }
}

extension View {
    func placeHolder<T:View>(_ holder: T, show: Bool) -> some View {
        self.modifier(PlaceHolder(placeHolder:holder, show: show))
    }
}
