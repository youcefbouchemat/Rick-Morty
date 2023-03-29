//
//  CharacterService.swift
//  Rick&Morty
//
//  Created by apple on 28/3/2023.
//

import Foundation


protocol CharacterServiceProtocol{
    func fetchCharacters() async throws -> [CharacterModel]
}

final class CharacterService: CharacterServiceProtocol{
    
    enum CharacterServiceError: Error{
        case failed
        case failedToDecode
        case invalidStatusCode
    }
    
    func fetchCharacters() async throws -> [CharacterModel] {
        let urlSession = URLSession.shared
        let url  = URL(string: APIConstants.baseUrl.appending("character"))
        let (data,response) = try await urlSession.data(from: url!)
        
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else{
            throw CharacterServiceError.invalidStatusCode
        }
        let decodedData = try JSONDecoder().decode(CharacterServiceResult.self, from: data)
        return decodedData.results
    }
}
