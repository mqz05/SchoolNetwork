//
//  MainHome.swift
//  School Network
//
//  Created by Mu qi Zhang on 3/3/22.
//

import SwiftUI

struct MainHome: View {
    var body: some View {
        ZStack {
            Color.primaryLightBlue3.ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    // Doble boton
                    VStack {
                        
                        RoundedRectangle(cornerRadius: 20).hidden()
                        
                        BotonTemporal(text: "Noticias", color: .orange, radius: 20)
                        
                        BotonTemporal(text: "Market", color: .red, radius: 20)
                    }
                    
                    // Calendario
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: screenWidth * 0.52)
                        .foregroundColor(.blue)
                    
                    //
                    // IDEA DE TRANSICION: minimizar al menu, seleccionar modo (ej: calendario), cambiar pantalla derecha y animacion de abrir la pantalla
                    //
                }
                
                VStack {
                    BotonTemporal(text: "Recordatorio 1", color: .lightPurple, radius: 35)
                    
                    BotonTemporal(text: "Recordatorio 2", color: .lightPurple, radius: 35)
                    
                    BotonTemporal(text: "Recordatorio 3", color: .lightPurple, radius: 35)
                    
                    BotonTemporal(text: "Recordatorio 4", color: .lightPurple, radius: 35)
                    
                }.frame(height: screenHeight * 0.64, alignment: .top)
                    .padding(.top, 5)
            }.padding(.horizontal)
        }
    }
}

struct MainHome_Previews: PreviewProvider {
    static var previews: some View {
        MainHome()
    }
}
