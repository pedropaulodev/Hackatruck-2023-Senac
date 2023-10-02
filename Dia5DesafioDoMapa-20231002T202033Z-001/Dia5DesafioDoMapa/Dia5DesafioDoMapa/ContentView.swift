import SwiftUI
import MapKit

struct ContentView: View {
    @State private var isSheetPresented = false
    
    // Chamada da biblioteca e guardando as informações da localização e do zoom do mapa
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: -14.2350, longitude: -51.9253),
        span: MKCoordinateSpan(latitudeDelta: 40, longitudeDelta: 40)
    )
    
    // Estrutura que representa locais no mapa com informações de anotação
    struct LocationAnnotation: Identifiable {
        let id = UUID()
        let name: String
        let coordinate: CLLocationCoordinate2D
        let flag: String
        let description: String
    }
    
    // Criando o objeto e adicionando as informações
    let locationAnnotations: [LocationAnnotation] = [
        LocationAnnotation(
            name: "Brasil",
            coordinate: CLLocationCoordinate2D(latitude: -14.2350, longitude: -51.9253),
            flag: "https://static.todamateria.com.br/upload/ba/nd/bandeira-do-brasil-og.jpg?class=ogImageRectangle",
            description: "O Brasil é o maior país da América do Sul, conhecido por sua cultura diversificada, praias deslumbrantes e floresta tropical única, a Amazônia."
        ),
        
        LocationAnnotation(
            name: "Estados Unidos",
            coordinate: CLLocationCoordinate2D(latitude: 37.0902, longitude: -95.7129),
            flag: "https://static.todamateria.com.br/upload/ba/nd/bandeira_americana_bb.jpg",
            description: "Os Estados Unidos são uma nação vasta e diversificada, conhecida por sua influência global, diversidade cultural e paisagens impressionantes."
        ),
        
        LocationAnnotation(
            name: "Austrália",
            coordinate: CLLocationCoordinate2D(latitude: -25.2744, longitude: 133.7751),
            flag: "https://s4.static.brasilescola.uol.com.br/be/2022/10/bandeira-nova-zelandia.jpg",
            description: "A Austrália é um continente-ilha cercado por águas cristalinas, conhecida por sua vida selvagem única, praias espetaculares e vastos desertos."
        ),
        
        LocationAnnotation(
            name: "Japão",
            coordinate: CLLocationCoordinate2D(latitude: 36.2048, longitude: 138.2529),
            flag: "https://www.br.emb-japan.go.jp/cultura/bandeira.jpg",
            description: "O Japão é uma nação insular no Extremo Oriente, famosa por sua cultura rica, tecnologia avançada e belos jardins zen."
        ),
        
        LocationAnnotation(
            name: "Canadá",
            coordinate: CLLocationCoordinate2D(latitude: 56.1304, longitude: -106.3468),
            flag: "https://s5.static.brasilescola.uol.com.br/be/2021/04/bandeira-do-canada.jpg",
            description: "O Canadá é conhecido por sua natureza intocada, vastas florestas, montanhas majestosas e cidades multiculturais."
        )
    ]
    //variavel auxiliar que permite acessar os objs na sheet
    @State var Aux =  LocationAnnotation(
        name: "Canadá",
        coordinate: CLLocationCoordinate2D(latitude: 56.1304, longitude: -106.3468),
        flag: "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Flag_of_Canada_%28Pantone%29.svg/1200px-Flag_of_Canada_%28Pantone%29.svg.png",
        description: "O Canadá é conhecido por sua natureza intocada, vastas florestas, montanhas majestosas e cidades multiculturais."
    )
    
    var body: some View {
        VStack {
            VStack {
                Text("World map")
                    .fontWeight(.bold)
                    .font(.system(size: 24))
                Text(Aux.name)
                Spacer()
            }

            VStack {
                // Criação do mapa usando a região definida na propriedade region
                Map(coordinateRegion: $region, showsUserLocation: true, annotationItems: locationAnnotations) { location in
                    MapAnnotation(coordinate: location.coordinate) {
                        Image(systemName: "pin.fill")
                            .foregroundColor(.black)
                            .font(.title)
                            .onTapGesture {
                                Aux = location
                                isSheetPresented.toggle()
                            }
                        
                    }
                }
                .frame(width: 400, height: 600)
                .padding(.bottom, 50)
                //sheetview
                .sheet(isPresented: $isSheetPresented){
                    VStack{
                        
                            Text(Aux.name)
                                .fontWeight(.bold)
                                .font(.system(size: 24))
                            
                        
                        
                        
                            AsyncImage(url: URL(string: Aux.flag)) { image in
                                            image
                                                .resizable()
                                                .frame(width: 70, height: 50)      
                                        } placeholder: {
                                            Image(systemName: "ellipsis").padding()
                                        }
                          
                        
                        VStack{
                            Text(Aux.description)
                            Spacer()
                            
                        }
                        
                    }
                }
            }

            ScrollView(.horizontal) {
                HStack {
                    ForEach(locationAnnotations) { location in
                        Button(action: {
                            Aux = location
                            region.center = location.coordinate
                        }) {
                            Text((location.name))
                                .font(.headline)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
