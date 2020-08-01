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
        Text(beer.name)
    }
}

struct BeerView_Previews: PreviewProvider {
    static var previews: some View {
        BeerView(beer: Beer())
    }
}
