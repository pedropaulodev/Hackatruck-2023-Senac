//
//  CharacterDescription.swift
//  Dia5API
//
//  Created by Student21 on 12/09/23.
//

import SwiftUI

struct CharacterDescription: View {
    let CharacterDescription: HaPo
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: CharacterDescription.image!)) { Image in
                Image
                    .resizable()
                    .frame(width: 130, height: 130)
                    .cornerRadius(80)
                    .padding(15)
            } placeholder: {
                Text("erro")
            }
            Text(CharacterDescription.name!)
                .font(.system(size: 30, weight: .bold))
            Spacer()
        }
        
    }
    
}
    



