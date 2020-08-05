//
//  BeerView.swift
//  Bebeer
//
//  Created by Mathis Paturle on 01/08/2020.
//  Copyright © 2020 Mathis Paturle. All rights reserved.
//

import SwiftUI

struct BeerView: View {
    
    var beer: Beer
    @ObservedObject var remoteImageURL: RemoteImageUrl
    
    init(beer: Beer) {
        self.beer = beer
        remoteImageURL = RemoteImageUrl(imageUrl: beer.image_url ?? "")
    }
    
    var body: some View {
        
        ScrollView (showsIndicators: false) {
            ZStack (alignment: .top) {
                
                //Bg
                Rectangle()
                    .foregroundColor(Color(UIColor.FlatColor.Yellow.Turbo))
                    .edgesIgnoringSafeArea(.all)
                
                //Content
                VStack(alignment: .leading) {
                    VStack(alignment: .leading, spacing: 25) {
                        VStack(alignment: .leading) {
                            Text(self.beer.name)
                                .font(.largeTitle)
                                .bold()
                                .foregroundColor(.white)
                            Text(self.beer.first_brewed)
                                .bold()
                                .font(Font.headline.italic())
                                .foregroundColor(Color(UIColor.FlatColor.Yellow.Brownish))
                        }
                        
                        VStack(alignment: .leading) {
                            Text("\(String(self.beer.abv)) %")
                                .font(.title)
                                .bold()
                                .foregroundColor(.white)
                            Text("ABV")
                                .bold()
                                .font(Font.headline.italic())
                                .foregroundColor(Color(UIColor.FlatColor.Yellow.Brownish))
                        }
                        
                        VStack(alignment: .leading) {
                            Text("\(String(self.beer.ibu))")
                                .font(.title)
                                .bold()
                                .foregroundColor(.white)
                            Text("IBU")
                                .bold()
                                .font(Font.headline.italic())
                                .foregroundColor(Color(UIColor.FlatColor.Yellow.Brownish))
                        }
                        
                    }
                    .padding(EdgeInsets(top: 0, leading: 32, bottom: 25, trailing: 32))
                    
                    Spacer()
                    
                    ZStack (alignment: .topLeading) {
                        Rectangle().foregroundColor(.white).cornerRadius(30)
                            .padding(8)
                        
                        VStack(alignment: .leading, spacing: 25) {
                            HStack{
                                Spacer()
                                Image(uiImage: ((self.remoteImageURL.data.isEmpty) ? UIImage(named: "placeholder-beer") : UIImage(data: self.remoteImageURL.data))!)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 250, alignment: .bottomLeading)
                                    .shadow(color: Color(UIColor.FlatColor.Gray.Iron), radius: 2, x: 0, y: 3)
                                    .padding(EdgeInsets(top: -200, leading: 0, bottom: 0, trailing: 32))
                            }
                            
                            VStack(alignment: .leading) {
                                Text("Description")
                                    .font(.subheadline)
                                    .bold()
                                    .foregroundColor(Color(UIColor.FlatColor.Violet.BlueGem))
                                Text(self.beer.description)
                                    .font(.subheadline)
                                    .foregroundColor(Color(UIColor.FlatColor.Gray.IronGray))
                            }
                            
                            VStack(alignment: .leading) {
                                Text("Tagline")
                                    .font(.subheadline)
                                    .bold()
                                    .foregroundColor(Color(UIColor.FlatColor.Violet.BlueGem))
                                Text(self.beer.tagline)
                                    .font(.subheadline)
                                    .foregroundColor(Color(UIColor.FlatColor.Gray.IronGray))
                            }
                            
                            VStack(alignment: .leading) {
                                Text("Brewer Tip")
                                    .font(.subheadline)
                                    .bold()
                                    .foregroundColor(Color(UIColor.FlatColor.Violet.BlueGem))
                                Text(self.beer.brewers_tips)
                                    .font(.subheadline)
                                    .foregroundColor(Color(UIColor.FlatColor.Gray.IronGray))
                            }
                            
                            Spacer()
                        }
                        .padding(EdgeInsets(top: 0, leading: 32, bottom: 25, trailing: 32))
                    }
                    .edgesIgnoringSafeArea(.all)
                    
                }
            }
            .padding(EdgeInsets(top: 100, leading: 0, bottom: 0, trailing: 0))
            .accentColor(.white)
            .edgesIgnoringSafeArea(.all)
            .foregroundColor(Color(UIColor.FlatColor.Yellow.Turbo))

        }
        .foregroundColor(Color(UIColor.FlatColor.Yellow.Turbo))
        .background(Color(UIColor.FlatColor.Yellow.Turbo))
        .edgesIgnoringSafeArea(.all)

    }

}

struct BeerView_Previews: PreviewProvider {
    static var previews: some View {
        BeerView(beer: Beer())
    }
}
