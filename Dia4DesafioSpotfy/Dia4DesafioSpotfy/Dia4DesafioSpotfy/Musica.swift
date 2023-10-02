//
//  Musica.swift
//  Dia4DesafioSpotfy
//
//  Created by Student21 on 05/09/23.
//

import SwiftUI

struct Musica: View {
    var body: some View {
        VStack{
            VStack{
                AsyncImage(url: URL(string: "https://br.web.img3.acsta.net/c_310_420/pictures/15/05/06/18/45/565916.jpg")) { image in
                    image
                        .resizable()
                        .frame(width: 200, height: 200)
         
                    
                } placeholder: {
                    Text("Carregando")
                }
                Text("Não existe amor em SP")
                    .font(.system(size: 20))
                    .bold()
                Text("Criolo")
                
            }
            HStack{
                Image(systemName: "shuffle").font(.system(size: 30))
                Image(systemName: "backward.end.fill").font(.system(size: 30)).padding(20)
                Image(systemName: "play.fill").font(.system(size: 50)).padding(20)
                Image(systemName: "forward.end.fill").font(.system(size: 30)).padding(20)
                Image(systemName: "repeat").font(.system(size: 30))

            }
            
            .frame(width: 300,height: 300)
        }
        .foregroundColor(.white)
        .frame(width:400, height: 900)
        .background(
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .center)
            )
        .ignoresSafeArea()
        
    }
    
}

struct Musica_Previews: PreviewProvider {
    static var previews: some View {
        Musica()
    }
}
