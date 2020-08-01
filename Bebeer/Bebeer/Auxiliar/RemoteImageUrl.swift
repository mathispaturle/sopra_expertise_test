//
//  RemoteImageUrl.swift
//  Bebeer
//
//  Created by Mathis Paturle on 31/07/2020.
//  Copyright © 2020 Mathis Paturle. All rights reserved.
//

import SwiftUI

class RemoteImageUrl: ObservableObject {
    
    @Published var data = Data()
    
    init(imageUrl: String) {
        guard let url = URL(string: imageUrl) else { return }
        URLSession.shared.dataTask(with: url) { ( data, response, error) in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.data = data
            }
        }.resume()
    }
}
