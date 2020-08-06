//
//  BeerRowView.swift
//  Bebeer
//
//  Created by Mathis Paturle on 01/08/2020.
//  Copyright © 2020 Mathis Paturle. All rights reserved.
//

import SwiftUI

struct BeerRowView: View {
    
    var beer: Beer
    @ObservedObject var remoteImageURL: RemoteImageUrl
    
    init(beer: Beer) {
        self.beer = beer
        remoteImageURL = RemoteImageUrl(imageUrl: beer.image_url ?? "")
    }
    
    var body: some View {
        
        HStack(alignment: .top, spacing: 32){
            ZStack (alignment: .leading){
                Rectangle()
                   .foregroundColor(Color(UIColor.FlatColor.Yellow.Turbo))
                   .frame(width: 60, height: 200).shadow(color: Color(UIColor.FlatColor.Gray.Iron), radius: 10, x: 0, y: 3)
                    .cornerRadius(15, corners: [.topLeft, .bottomLeft])
                
                Image(uiImage: ((self.remoteImageURL.data.isEmpty) ? UIImage(named: "placeholder-beer") : UIImage(data: self.remoteImageURL.data))!)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200, alignment: .bottomLeading)
               
                .shadow(color: Color(UIColor.FlatColor.Gray.Iron), radius: 2, x: 0, y: 3)
                .padding(EdgeInsets(top: 0, leading: 32, bottom: 0, trailing: 0))
            }
            
            VStack(alignment: .leading,spacing: 8) {
                
                Text(beer.name)
                    .font(.largeTitle)
                    .foregroundColor(Color(UIColor.FlatColor.Yellow.Turbo)).aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("\(String(beer.abv)) %")
                    .foregroundColor(Color(UIColor.FlatColor.Gray.AlmondFrost))
                    .font(.title)
                
                Text(beer.tagline)
                    .foregroundColor(Color(UIColor.FlatColor.Gray.IronGray))
                    .font(.body)
                
                
            }.padding(EdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0))
            
            Spacer()
        }.padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 8))
        
    }
}

struct BeerRowView_Previews: PreviewProvider {
    static var previews: some View {
        BeerRowView(beer: Beer())
    }
}
