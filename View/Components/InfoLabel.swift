//
//  InfoLabel.swift
//  Rick&Morty
//
//  Created by apple on 29/3/2023.
//

import SwiftUI

struct InfoLabel: View {
    let information: String
    let icon: String
    
    var body: some View {
        HStack{
            Image(systemName: icon)
                .fontWeight(.bold)
            Text(information)
        }
    }
}

struct InfoLabel_Previews: PreviewProvider {
    static var previews: some View {
        InfoLabel(information: "jejej", icon:"heart")
    }
}
