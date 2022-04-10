//
//  AccountView.swift
//  School Network
//
//  Created by Mu qi Zhang on 3/3/22.
//

import SwiftUI

struct AccountView: View {
    
    
    
    var body: some View {
        
        ZStack {
            Color.primaryLightBlue1.ignoresSafeArea()
            
            VStack(spacing: 20) {
                Circle()
                    .foregroundColor(.secondaryDarkBlue1)
                    .frame(width: screenWidth * 0.55, height: screenWidth * 0.55)
                
                CustomDataField("Correo Electrónico", text: <#Binding<String>#>, isPassword: false).padding(.horizontal, 70)
                
                CustomDataField("Contraseña", isPassword: true).padding(.horizontal, 70)
                
                Rectangle()
                    .frame(height: screenHeight * 0.15)
                    .hidden()
            }
            
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
