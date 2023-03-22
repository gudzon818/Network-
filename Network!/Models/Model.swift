//
//  Model.swift
//  Network!
//
//  Created by user on 21.03.2023.
//

import Foundation

struct Beer: Decodable {
    let id: Int
    let name: String
    let tagline: String
    let first_brewed: String
    let description: String
    let image_url: String
    let abv: Double
}


