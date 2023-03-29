//
//  HomeScreen.swift
//  Rick&Morty
//
//  Created by apple on 29/3/2023.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject private var vm: CharacterViewModel = CharacterViewModel(service: CharacterService())
    var body: some View {
        NavigationStack{
            switch vm.state {
            case .success(let data):
                List {
                    ForEach(data, id: \.id) { item in
                        CharacterCard(character: item)
                    }
                }
                .navigationTitle("Characters")
            case .na:
                Text("na")
            case .loading:
                ProgressView()
            case .failed(error: let error):
                Text(String(describing: error))
            }
        }.task {
            await vm.fetchCharacter()
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
