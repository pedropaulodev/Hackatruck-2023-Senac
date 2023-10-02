//
//  ContentView.swift
//  Dia2Desafio1ImcECores
//
//  Created by Student21 on 01/09/23.
//

import SwiftUI

struct ContentView: View {
    @State private var pesoTexto = ""
    @State private var alturaTexto = ""
    @State private var peso: Double = 0.0
    @State private var altura: Double = 0.0

    @State private var imc: Double = 0.0
    @State private var exibicao: String = ""
    @State private var cor: String = "Normal"

    var body: some View {
        
        VStack {
           
            
            VStack{
                Text("Calculadora de IMC")
                    .font(.system(size: 30))
                    .bold()
                    .font(.headline)
                
                
                TextField("Digite o peso", text: $pesoTexto)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                TextField("Digite sua altura", text: $alturaTexto)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button(action: {
                    peso = Double(pesoTexto)!
                    altura = Double(alturaTexto)!
                    imc = peso / (altura * altura)
                    
                    if imc <= 18.5{
                        exibicao = "Baixo Peso"
                        cor = "Baixo Peso"
                    }else if imc <= 24.99{
                        exibicao = "Normal"
                        cor = "Normal"
                    }else if imc <= 29.99{
                        exibicao = "Sobrepeso"
                        cor = "Sobrepeso"
                    }else if imc > 30{
                        exibicao = "Obesidade"
                        cor = "Obesidade"
                    }
                    
                }) {
                    Text("Calcular")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Rectangle().fill(Color.blue)) // Define um retângulo azul como fundo
                        .cornerRadius(10)
                }

               Spacer()
                Text(exibicao)
                .foregroundColor(.white)
                .font(.system(size: 40))
                .bold()
                .offset(y:50)
                
                .padding()
            }
            
            
            
            VStack{
                Spacer()
                Image("Image")
                    .resizable()
                    .frame(width: 430, height: 200)
            }
            
        }.background(Color(cor))
        
    }
}









struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
