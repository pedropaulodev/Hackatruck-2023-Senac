//
//  ContentView.swift
//  Dia4DesafioSpotfy
//
//  Created by Student21 on 05/09/23.
//

import SwiftUI

struct ContentView: View {
    //o molde dos objetos
    struct Song : Identifiable{
        var id: Int
        var nome : String
        var artist : String
        var capa : String
    }
    // criando os objetos e colocando dentro de um array
    @State var arrayMusicas = [
        Song(id: 1, nome: "Brasilia amarela", artist: "Mamonas assassinas", capa: "https://lastfm.freetls.fastly.net/i/u/500x500/f102dd30c91f1db5129203ee39163e65.jpg"),
        Song(id: 2, nome: "Feliz para cachorro", artist: "Cinco a Seco", capa: "https://lastfm.freetls.fastly.net/i/u/770x0/1a88e7170e75556466bd7c1c8d717a8b.jpg#1a88e7170e75556466bd7c1c8d717a8b"),
        Song(id: 3, nome: "Não existe amor em sp", artist: "Criolo", capa: "https://br.web.img3.acsta.net/c_310_420/pictures/15/05/06/18/45/565916.jpg"),
        Song(id: 4, nome: "Sem Cortesia", artist: "Sintese", capa: "https://lastfm.freetls.fastly.net/i/u/500x500/2c2e01a4ca964fdecfb0b5c7d3048620.jpg")
        
    ]
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    VStack{
                        Image("minhao")
                            .resizable()
                            .aspectRatio( contentMode: .fit)
                            .frame(width: 200, height: 200)
                            .padding(.top, 100)
                        Text("HackaFM")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                        HStack(spacing: 0){
                            Image("minhao")
                                .resizable()
                                .aspectRatio( contentMode: .fit)
                                .frame(width: 30, height: 30)
                                .padding()
                            Text("Hackasong")
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        
                        Spacer()
                        VStack{
                            ForEach(arrayMusicas) { musica in
                                NavigationLink(destination: Musica()){
                                    HStack {

                                        AsyncImage(url: URL(string: musica.capa)) { image in image
                                                .resizable()
                                                .frame(width: 100, height: 100)
                                        } placeholder: {
                                            Text("Carregando")
                                        }
                                        
                                        VStack(alignment: .leading){
                                            
                                            Text(musica.nome)
                                                .foregroundColor(.white)
                                                .fontWeight(.bold)
                                            Text(musica.artist)
                                                .foregroundColor(.white)
                                                .font(.subheadline)
                                            
                                            
                                        }
                                        Spacer()
                                        Image(systemName: "ellipsis")
                                            .foregroundColor(.white)
                                    }
                                }
                            }
                        }
                        Spacer()
                    }
  
                    
                    
                }
                
                
            }
            .frame(width:400, height: .infinity)
            .background(LinearGradient(
                gradient: Gradient(colors: [Color.blue, Color.black]),
                startPoint: .top,
                endPoint: .center
            )).ignoresSafeArea()
        }
        .tint(.white)
    }// do body
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
