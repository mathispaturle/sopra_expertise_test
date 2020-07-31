//
//  Beer.swift
//  Bebeer
//
//  Created by Mathis Paturle on 31/07/2020.
//  Copyright © 2020 Mathis Paturle. All rights reserved.
//

import SwiftUI

struct Beer: Identifiable, Decodable {
    let id: Int
    let name: String
    let tagline: String
    let first_brewed: String
    let description: String
    let image_url: String?
    let abv: Float
    let ibu: Int
    let target_fg: Int
    let target_og: Int
    let ebc: Int
    let srm: Float
    let ph: Float
    let attenuation_level: Float
    let food_pairing: [String]
    let brewers_tips: String
    let contributed_by: String
}

