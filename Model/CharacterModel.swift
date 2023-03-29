//
//  Character.swift
//  Rick&Morty
//
//  Created by apple on 28/3/2023.
//

import Foundation

struct CharacterServiceResult: Codable{
    let results: [CharacterModel]
}

struct CharacterModel: Codable{
    let id: Int
    let name: String
    let image: URL
    let status: String
    let gender: String
}
