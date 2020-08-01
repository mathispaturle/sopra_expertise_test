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
        
        HStack {
            Image(uiImage: ((self.remoteImageURL.data.isEmpty) ? UIImage(named: "placeholder-image") : UIImage(data: self.remoteImageURL.data))!)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(beer.name)
        }
    }
}

struct BeerRowView_Previews: PreviewProvider {
    static var previews: some View {
        BeerRowView(beer: Beer())
    }
}
