import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ForEach(viewModel.chars) { index in
                        NavigationLink(destination: CharacterDescription(CharacterDescription: index)) {
                            HStack {
                                AsyncImage(url: URL(string: index.image!)) { Image in
                                    Image
                                        .resizable()
                                        .frame(width: 130, height: 130)
                                        .cornerRadius(80)
                                        .padding(15)
                                } placeholder: {
                                    Text("erro")
                                }
                                Text(index.name!)
                                    .font(.system(size: 30, weight: .bold))
                                Spacer()
                            }
                        }
                    }
                }
            }
            .onAppear() {
                viewModel.fetch()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
