//
//  ContentView.swift
//  Bebeer
//
//  Created by Mathis Paturle on 30/07/2020.
//  Copyright © 2020 Mathis Paturle. All rights reserved.
//

import SwiftUI

struct HomeView: View {
        
    //Search Field vars
    @State private var searchText = ""
    @State private var showConfirmButton: Bool = false
    
    //Nav state
    @State var showBeerListView = false
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?

    var body: some View {
         
        VStack {
            VStack(alignment: .leading, spacing: 8){
                
                Text("Welcome to ").bold()
                    .font(.largeTitle)
                    .foregroundColor(Color(UIColor.FlatColor.Violet.BlueGem))
                    + Text("BeBEER")
                        .bold()
                        .font(.largeTitle)
                        .foregroundColor(Color(UIColor.FlatColor.Yellow.Turbo))
                    + Text(".").bold()
                    .font(.largeTitle)
                    .foregroundColor(Color(UIColor.FlatColor.Violet.BlueGem))

                // Search view
                HStack {
                    HStack (alignment: .center) {
                        
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color(UIColor.FlatColor.Gray.Iron))
                        
                        
                        TextField("", text: $searchText, onCommit: {
                            
                            print(self.searchText)
                            
                            
                            
                            //Perform search via ViewModel
                            //self.beerViewModel.fetchBeers(food: self.searchText)
                            
                            
                            
                            self.viewControllerHolder?.present(style: .fullScreen) {
                                
                                BeerListView(foodString: self.searchText)
                                
                                Button("Cancel") {
                                    NotificationCenter.default.post(name: Notification.Name(rawValue: "dismissModal"), object: nil)
                                }
                            }
                            
                            
                            
                            }).foregroundColor(Color(UIColor.FlatColor.Gray.IronGray))
                            .placeHolder(Text("Find your beer"), show: searchText.isEmpty)
                            .accentColor(Color(UIColor.FlatColor.Violet.BlueGem))
                            .foregroundColor(Color(UIColor.FlatColor.Gray.Iron))
                           
                        Button(action: {
                            self.searchText = ""
                        }) {
                            Image(systemName: "xmark.circle.fill").opacity(searchText == "" ? 0 : 1)
                        }
                    }
                    .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                    .foregroundColor(.secondary)
                    .background(Color(.white))
                    .cornerRadius(10.0)
                    .shadow(color: Color(UIColor.FlatColor.Gray.Iron), radius: 10, x: 0, y: 3)

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

            }.padding(32)
            
            ZStack {
                
                Rectangle()
                    .foregroundColor(Color(UIColor.FlatColor.Yellow.Turbo))
                    .cornerRadius(20, corners: [.topLeft, .topRight])
                    .shadow(color: Color(UIColor.FlatColor.Gray.Iron), radius: 10, x: 0, y: 0)

                
                VStack (alignment: .leading){
                    
                    
                    Spacer()

                    Text("App created by Mathis Paturle")
                    .bold()
                    .foregroundColor(.white)
                    .padding()
                }
            }.edgesIgnoringSafeArea(.bottom)
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
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
