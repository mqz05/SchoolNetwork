//
//  MenuView.swift
//  School Network
//
//  Created by Mu qi Zhang on 2/3/22.
//

import SwiftUI

struct MenuView: View {
    
    @State var modoSeleccionado: MenuModesData = .home
    
    @Binding var isShowingMenu: Bool
    
    @Binding var home: AnyView
    
    var body: some View {
        
        ZStack {
            
            Color.purpl.ignoresSafeArea()
            
            HStack {
                
                VStack(alignment: .leading, spacing: 30) {
                    
                    /* MARK: Present Full Screen
                    NavigationLink(destination: AccountView().frame(width: screenWidth, height: screenHeight).clipped().onAppear {modoSeleccionado = .profile}, label: {
                        Profile()
                    })*/
                    
                    Button(action: {
                        withAnimation(.spring(), {
                            isShowingMenu.toggle()
                        })
                    }, label: {
                        BotonCruz()
                            .frame(width: 40, height: 30)
                    })
                        .opacity(isShowingMenu ? 1 : 0)
                    
                    
                    Profile().onTapGesture {
                        withAnimation(.spring()) {
                            home = findSelectedView(section: .profile)
                            
                        }
                    }
                    
                    
                    ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 25) {
                        
                        
                        ForEach(MenuModesData.allCases, id: \.self) {seccion in
                            Button(
                                action: {
                                    withAnimation(.spring()) {
                                        home = findSelectedView(section: seccion)
                                    }
                                
                                }, label: {
                                MenuSection(section: seccion)
                            })
                        }
                        
                        
                        
                    }
                    }
                    
                    
                }.frame(maxWidth: screenWidth / 2, maxHeight: screenHeight, alignment: .leading)
                    .padding(.leading)
                
                Spacer()
                
            }.frame(width: screenWidth)
            
        }
            .navigationBarBackButtonHidden(true)
            /*.navigationBarItems(leading: Button(action: {withAnimation(.spring(), { isShowingMenu.toggle() })}, label: {
                BotonCruz()
                    .frame(width: 40, height: 30)
            }))*/
    }
    
    @ViewBuilder
    func Profile() -> some View {
        
        let profileWidth = screenWidth * 0.55
        
        ZStack {
            
            VStack {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.primaryLightBlue2)
                    .aspectRatio(20/10, contentMode: .fit)
                    //.padding()
                
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.primaryBlue)
                    .aspectRatio(20/8, contentMode: .fit)
                    //.padding()
                
                
            }//.frame(height: profileHeight)
            
            Circle()
                .foregroundColor(.secondaryBlue)
                .aspectRatio(2/1, contentMode: .fit)
            
        }//.aspectRatio(4/3, contentMode: .fit)
            .frame(width: profileWidth)
    }
    
    
    
    @ViewBuilder
    func MenuSection(section: MenuModesData) -> some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color.secondaryBlue)
                .aspectRatio(3/1, contentMode: .fit)
                .frame(minWidth: screenWidth * 0.45)
        
            Text(section.sectionName)
                .fontWeight(.semibold)
        }
    }
    
    
    // FUNCION: Cambio a la vista seleccionada
    
    private func findSelectedView(section: MenuModesData) -> AnyView {
        modoSeleccionado = section
        return section.view
    }
}



struct MenuView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        MenuView(isShowingMenu: .constant(true), home: .constant(AnyView(Color.white)))
    }
}
