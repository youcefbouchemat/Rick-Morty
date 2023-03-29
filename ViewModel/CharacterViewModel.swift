//
//  CharacterViewModel.swift
//  Rick&Morty
//
//  Created by apple on 28/3/2023.
//

import Foundation

protocol CharacterViewModelProtocol: ObservableObject{
    func fetchCharacter() async
}

@MainActor
final class CharacterViewModel: CharacterViewModelProtocol{
    
    enum State{
        case na
        case loading
        case success(data: [CharacterModel])
        case failed(error: Error)
    }
    
    @Published private(set) var state: State = .na
    
    @Published var hasError: Bool = false;
    
    private let service: CharacterService
    
    init(service: CharacterService) {
        self.service = service
    }
    
    func fetchCharacter() async {
        self.state = .loading
        self.hasError = false
        
        do{
            let characters = try await service.fetchCharacters()
            self.state = .success(data: characters)
        } catch {
            self.hasError = true
            self.state = .failed(error: error)
        }
    }
    
    
}
