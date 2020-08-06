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
            
            //Top information Welcome to BeBeer and search field
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
                            
                            self.viewControllerHolder?.present(style: .fullScreen) {
                                BeerListView(foodString: self.searchText)
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
            }.padding(32)
            
            //Bottom information
            ZStack {
                Rectangle()
                    .foregroundColor(Color(UIColor.FlatColor.Yellow.Turbo))
                    .cornerRadius(20, corners: [.topLeft, .topRight])
                    .shadow(color: Color(UIColor.FlatColor.Gray.Iron), radius: 10, x: 0, y: 0)
                
                VStack (alignment: .center){
                    
                    Text("HOW TO USE BeBEER")
                    .bold()
                        .font(.title)
                        .padding(EdgeInsets(top: 32, leading: 32, bottom: 32, trailing: 32))
                        .foregroundColor(.white)
                    
                    ScrollView (.vertical, showsIndicators: false) {
                         VStack {
                            
                            //First section
                            ZStack(alignment: .leading) {
                                Rectangle().foregroundColor(Color(UIColor.FlatColor.Violet.BlueGem)).frame(maxWidth: .infinity, alignment: .leading).cornerRadius(8)
                                
                                HStack(alignment: .top){
                                    Text("1.").bold().foregroundColor(.white)
                                    Text("Type in the food of your choice").foregroundColor(.white)
                                    Spacer()
                                    Image("search-bar")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 50, alignment: .bottomLeading)
                                        .colorInvert()
                                }.padding()
                                
                                
                            }.padding(EdgeInsets(top: 0, leading: 32, bottom: 0, trailing: 32))
                            
                            //Third section
                            ZStack(alignment: .leading) {
                                Rectangle().foregroundColor(Color(UIColor.FlatColor.Violet.BlueGem)).frame(maxWidth: .infinity, alignment: .leading).cornerRadius(8)
                                
                                HStack(alignment: .top){
                                    Text("2.").bold().foregroundColor(.white)
                                    Text("Browse among a large variety of beers").foregroundColor(.white)
                                    Spacer()
                                    Image("files")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 50, alignment: .bottomLeading)
                                        .colorInvert()
                                }.padding()
                                
                                
                            }.padding(EdgeInsets(top: 0, leading: 32, bottom: 0, trailing: 32))
                            
                            
                            //Second section
                            ZStack(alignment: .leading) {
                                Rectangle().foregroundColor(Color(UIColor.FlatColor.Violet.BlueGem)).frame(maxWidth: .infinity, alignment: .leading).cornerRadius(8)
                                
                                HStack(alignment: .top){
                                    Text("3.").bold().foregroundColor(.white)
                                    Text("Filter beers according to their ABV % ").foregroundColor(.white)
                                    Spacer()
                                    Image("filter")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 50, alignment: .bottomLeading)
                                        .colorInvert()
                                }.padding()
                                
                                
                            }.padding(EdgeInsets(top: 0, leading: 32, bottom: 0, trailing: 32))
                            
                            
                            //Third section
                            ZStack(alignment: .leading) {
                                Rectangle().foregroundColor(Color(UIColor.FlatColor.Violet.BlueGem)).frame(maxWidth: .infinity, alignment: .leading).cornerRadius(8)
                                
                                HStack(alignment: .top){
                                    Text("4.").bold().foregroundColor(.white)
                                    Text("Savour the beer with your food!").foregroundColor(.white)
                                    Spacer()
                                    Image("beer")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 50, alignment: .bottomLeading)
                                        .colorInvert()
                                }.padding()
                                
                                
                            }.padding(EdgeInsets(top: 0, leading: 32, bottom: 0, trailing: 32))
                            
                            
                         }.frame(width: 375, alignment: .leading)
                    }
                    

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

//ViewModifier for placeholder in search view
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

//Extension to handle placeHolder in search view
extension View {
    func placeHolder<T:View>(_ holder: T, show: Bool) -> some View {
        self.modifier(PlaceHolder(placeHolder:holder, show: show))
    }
}
