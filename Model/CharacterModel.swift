//
//  Character.swift
//  Rick&Morty
//
//  Created by apple on 28/3/2023.
//

import Foundation

struct Character: Codable{
    let id: Int
    let name: String
    let image: URL
    let status: String
    let gender: String
}
