//
//  ContentView.swift
//  School Network
//
//  Created by Mu qi Zhang on 1/1/22.
//

import SwiftUI

struct HomeView: View {
    
    @State var isShowingMenu = true
    
    @State var homeView: AnyView = AnyView(Color.black)
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                Color.purpl.ignoresSafeArea()
                
                if isShowingMenu == true {
                    
                    MenuView(isShowingMenu: $isShowingMenu, home: $homeView)
                    
                        .ignoresSafeArea()
                }
               
                SetUpHomeView
                
                if isShowingMenu == true {
                    MiniReturnHomeLayer(isShowingMenu: $isShowingMenu)
                        .frame(width: screenWidth, height: screenHeight)
                        //.cornerRadius(isShowingMenu ? 20 : 10)
                        .offset(x: isShowingMenu ? (screenWidth * 0.66) : 0)
                        .ignoresSafeArea()
                        .opacity(0.1)
                }
            }
                .onAppear {
                    homeView = AnyView(MainHome())
                }
            
            
        }.navigationViewStyle(StackNavigationViewStyle())
    }
    
    
    var SetUpHomeView: some View {
        
            homeView
                //.frame(width: width, height: height)
                //.cornerRadius(isShowingMenu ? 20 : 10)
                .offset(x: isShowingMenu ? (screenWidth * 0.66) : 0)
                //.scaleEffect(x: isShowingMenu ? 0.82 : 1, y: isShowingMenu ? 0.82 : 1)
                //.shadow(color: Color.white, radius: isShowingMenu ? 7.5 : 0)
                /*.navigationBarItems(leading: Button(action: {
                    withAnimation(.spring(), {
                        isShowingMenu.toggle()
                    })
                }, label: {
                    BotonTresLineas()
                        .frame(width: 40, height: 30)
                        .foregroundColor(.black)
                        .scaleEffect(1.2)
                }))*/
                
                .navigationBarHidden(isShowingMenu ? false : true)
                .allowsHitTesting(!isShowingMenu)
                .overlay(VStack {
                    
                    !isShowingMenu ? Button(action: {
                        withAnimation(.spring(), {
                            isShowingMenu.toggle()
                        })
                    }, label: {
                        BotonTresLineas()
                            .frame(width: 40, height: 30)
                            .scaleEffect(1.2)
                    })
                    : nil
                    
                    Spacer()
                }.frame(width: screenWidth * 0.9, alignment: .topLeading))
            
        
    }
    
    
    
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 13"))
    }
}

