//
//  FigurasPersonalizadas.swift
//  School Network
//
//  Created by Mu qi Zhang on 2/3/22.
//


import SwiftUI


//
// SEPARAR EN VARIOS ARCHIVOS DENTRO DE LA CARPETA "COMMON"
//



// Boton temporal
struct BotonTemporal: View {
    
    var text: String
    
    var color: Color
    
    var radius: CGFloat
    
    var body: some View {
        
        Button(action: {}, label: {
            ZStack {
                RoundedRectangle(cornerRadius: radius)
                    .foregroundColor(color)
                
                Text(text)
            }
        })
    }
}

//
// MARK: Seccion de Datos
//

struct CustomDataField: View {
    
    @Binding private var text: String
    @State private var isSecured: Bool = true
    private var title: String
    
    var isPassword: Bool
    
    @State private var isTapped = false
    
    init(_ title: String, text: Binding<String>, isPassword: Bool) {
        self.title = title
        self._text = text
        self.isPassword = isPassword
        self.isSecured = isPassword
    }
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 4) {
            
            HStack(spacing: 15) {
                
                if isPassword {
                    
                    CustomTextField(text: $text, isRevealed: $isSecured, isFocused: $isTapped)
                    
                } else {
                    
                    TextField("", text: $text, onEditingChanged: { edit in
                        
                        if text == "" {
                            if edit == true {
                                withAnimation(.easeIn, {
                                    isTapped = true
                                })
                            } else {
                                withAnimation(.easeIn, {
                                    isTapped = false
                                })
                            }
                        }
                    })
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                }
                
                if isPassword {
                    Button(action: { isSecured.toggle() }, label: {
                        Image(systemName: self.isSecured ? "eye.slash" : "eye")
                            .foregroundColor(.gray)
                    })
                }
            }
            
            .aspectRatio(8/1, contentMode: .fit)
            .padding(.top, isTapped ? 15 : 0)
            .background(
                Text(title)
                    .scaleEffect(isTapped ? 0.8 : 1)
                    .offset(x: isTapped ? -7 : 0, y: isTapped ? -15 : 0)
                    .foregroundColor(isTapped ? Color.accentColor : Color.gray)
                , alignment: .leading
            )
            
            .padding(.horizontal)
            
            Rectangle()
                .fill(isTapped ? Color.accentColor : Color.gray)
                .opacity(isTapped ? 1 : 0.5)
                .frame(height: 1)
                .padding(.top, 10)
            
        }
        .padding(.top, 15)
        .background(Color.gray.opacity(0.09))
        .cornerRadius(10)
    }
    
    
    private struct CustomTextField: UIViewRepresentable {
        
        // 1
        @Binding var text: String
        @Binding var isRevealed: Bool
        @Binding var isFocused: Bool

         // 2
        func makeUIView(context: UIViewRepresentableContext<CustomTextField>) -> UITextField {
            let tf = UITextField(frame: .zero)
            tf.isUserInteractionEnabled = true
            tf.delegate = context.coordinator
            return tf
        }

        func makeCoordinator() -> CustomTextField.Coordinator {
            return Coordinator(text: $text, isFocused: $isFocused)
        }

        // 3
        func updateUIView(_ uiView: UITextField, context: Context) {
            uiView.text = text
            uiView.isSecureTextEntry = isRevealed
        }

        // 4
        class Coordinator: NSObject, UITextFieldDelegate {
            @Binding var text: String
            @Binding var isFocused: Bool

            init(text: Binding<String>, isFocused: Binding<Bool>) {
                _text = text
                _isFocused = isFocused
            }

            func textFieldDidChangeSelection(_ textField: UITextField) {
                text = textField.text ?? ""
            }

            func textFieldDidBeginEditing(_ textField: UITextField) {
                DispatchQueue.main.async {
                    withAnimation(.spring()) {
                        self.isFocused = true
                    }
                }
            }

            func textFieldDidEndEditing(_ textField: UITextField) {
                DispatchQueue.main.async {
                    withAnimation(.spring()) {
                        if self.text == "" {
                            self.isFocused = false
                        }
                    }
                }
            }

            func textFieldShouldReturn(_ textField: UITextField) -> Bool {
                textField.resignFirstResponder()
                return false
            }
        }
    }
}


//
// MARK: Redondear Esquinas
//

struct EsquinasRedondeadas: Shape {
    
    var esquinas: UIRectCorner
    var radio: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: esquinas, cornerRadii: CGSize(width: radio, height: radio))
        
        return Path(path.cgPath)
    }
}




//
// MARK: Fondo Degradado
//

struct BackgroundView: View {
    var topColor: Color
    var bottomColor: Color
    var isHorizontal: Bool
    
    var body: some View {
        
        isHorizontal ? LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]), startPoint: .leading, endPoint: .trailing)
            .ignoresSafeArea(edges: .all) : LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]), startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea(edges: .all)
    }
}



//
// MARK: Boton Tres Lineas (Menu)
//

struct BotonTresLineas: View {
    
    var body: some View {
        
        VStack(spacing: 5) {
            Capsule()
                .fill(Color.black)
                .frame(width: 30, height: 3)
            
            Capsule()
                .fill(Color.black)
                .frame(width: 30, height: 3)
            
            Capsule()
                .fill(Color.black)
                .frame(width: 30, height: 3)
        }
    }
}



//
// MARK: Boton Cruz (Menu)
//

struct BotonCruz: View {
    
    var body: some View {
        
        VStack(spacing: 5) {
            Capsule()
                .fill(Color.white)
                .frame(width: 35, height: 3)
                .rotationEffect(.init(degrees: -45))
                .offset(x: 0, y: 8)
            
            
            Capsule()
                .fill(Color.white)
                .frame(width: 35, height: 3)
                .rotationEffect(.init(degrees: 45))
            
        }
    }
}



//
// MARK: Mini Return Home Layer
//

struct MiniReturnHomeLayer: View {
    
    @Binding var isShowingMenu: Bool
    
    var body: some View {
        
        let layer = BackgroundView(topColor: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.01488226232)), bottomColor: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.01488226232)), isHorizontal: false)
        
        Button(action: {
            withAnimation(.spring(), {
                isShowingMenu.toggle()
            })
            
        }, label: {
            layer
        })
    }
}


