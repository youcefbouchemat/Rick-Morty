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
                Text("No Content")
            case .loading:
                ProgressView()
            case .failed(error: _):
                EmptyView()
            }
        }
        .task {
            await vm.fetchCharacter()
        }
        .alert("Error", isPresented: $vm.hasError, presenting: vm.state) { detail in
            Button("Retry") {
                Task{
                    await vm.fetchCharacter()
                }
            }
        } message: { detail in
            if case let .failed(error) = detail{
                Text(error.localizedDescription)
            }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
