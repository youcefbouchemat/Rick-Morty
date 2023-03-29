//
//  CharacterCard.swift
//  Rick&Morty
//
//  Created by apple on 29/3/2023.
//

import SwiftUI

struct CharacterCard: View {
    let character: CharacterModel
    var body: some View {
        HStack{
            AsyncImage(url: character.image,
                       content: { image in
                image.resizable()
                    .frame(width:150,height: 150)
            },
            placeholder: {
                ProgressView()
            }
            )
            
            VStack(alignment: .leading){
                Spacer()
                InfoLabel(information: character.name, icon: "person")
                Spacer()
                InfoLabel(information: character.gender, icon: "figure.dress.line.vertical.figure")
                Spacer()
                Text(character.status)
                Spacer()
            }
        }
        .frame(minHeight: 150)
    }
}

struct CharacterCard_Previews: PreviewProvider {
    static var previews: some View {
        CharacterCard(character: CharacterModel(id: 73,
                                                name: "youcef",
                                                image: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")!,
                                                status: "alive",
                                                gender: "male"))
    }
}
