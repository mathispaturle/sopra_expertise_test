//
//  Beer.swift
//  Bebeer
//
//  Created by Mathis Paturle on 31/07/2020.
//  Copyright © 2020 Mathis Paturle. All rights reserved.
//

import SwiftUI

struct Beer: Identifiable, Decodable {
    let uuid = UUID()
    let id: Int
    let name: String
    let tagline: String
    let first_brewed: String
    let description: String
    let image_url: String?
    let abv: Float
    let ibu: Int
    let target_fg: Float
    let target_og: Float
    let ebc: Float
    let srm: Float
    let ph: Float
    let attenuation_level: Float
    let food_pairing: [String]
    let brewers_tips: String
    let contributed_by: String
    
    init(){
        self.id = 0
        self.name = "name"
        self.tagline = "tagline"
        self.first_brewed = "first brewed"
        self.description = "description"
        self.image_url = ""
        self.abv = 0
        self.ibu = 0
        self.target_fg = 0
        self.target_og = 0
        self.ebc = 0
        self.srm = 0
        self.ph = 0
        self.attenuation_level = 0
        self.food_pairing = [""]
        self.brewers_tips = "brewer tips"
        self.contributed_by = "contributed by"
    }
}

