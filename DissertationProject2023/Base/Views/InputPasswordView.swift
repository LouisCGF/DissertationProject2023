//
//  InputPasswordView.swift
//  DissertationProject2023
//
//  Created by Louis on 03/03/2023.
//

import SwiftUI

struct InputPasswordView: View {
    
    @Binding var password: String
    @State var viewPassword: Bool
    let placeholder: String
    let sfSymbol: String?
    let sfSymbolColor: Color?
    
    private let textFieldLeading: CGFloat = 30
    @FocusState private var fieldIsFocused: Bool
    
    var body: some View {
        
        Group {
            
            if !viewPassword {
                SecureField(placeholder, text: $password)
                    .frame(maxWidth: .infinity,
                    minHeight: 50)
                    .padding(.leading, sfSymbol == nil ? textFieldLeading / 2 : textFieldLeading)
                    .focused($fieldIsFocused)
                    .background(
                    
                        ZStack (alignment: .leading) {
                            
                            if let systemImage = sfSymbol {
                                
                                Image(systemName: systemImage)
                                    .font(.system(size: 16, weight: .semibold))
                                    .padding(.leading, 3)
                                    .foregroundColor(sfSymbolColor?.opacity(fieldIsFocused ? 1 : 0.5))
                                    .onTapGesture {
                                        viewPassword.toggle()
                                    }
                                
                            }
                            
                            RoundedRectangle(cornerRadius: 10,
                                             style: .continuous)
                                .stroke(Color.gray.opacity(fieldIsFocused ? 1 : 0.5))
                        }
                )
                
            } else {
                TextField(placeholder, text: $password)
                    .frame(maxWidth: .infinity,
                    minHeight: 50)
                    .padding(.leading, sfSymbol == nil ? textFieldLeading / 2 : textFieldLeading)
                    .focused($fieldIsFocused)
                    .background(
                    
                        ZStack (alignment: .leading) {
                            
                            if let systemImage = "eye" {
                                
                                Image(systemName: systemImage)
                                    .font(.system(size: 16, weight: .semibold))
                                    .padding(.leading, 3)
                                    .foregroundColor(sfSymbolColor?.opacity(fieldIsFocused ? 1 : 0.5))
                                    .onTapGesture {
                                        viewPassword.toggle()
                                    }
                                
                            }
                            
                            RoundedRectangle(cornerRadius: 10,
                                             style: .continuous)
                                .stroke(Color.gray.opacity(fieldIsFocused ? 1 : 0.5))
                        }
                )
            }
            
        }
    }
}

struct InputPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            InputPasswordView(password: .constant(""),
                              viewPassword: false,
                              placeholder: "Password",
                              sfSymbol: "eye.slash",
                              sfSymbolColor: .black)
            .preview(with: "Input Password View with sfsymbol")
            
            InputPasswordView(password: .constant(""),
                              viewPassword: false,
                              placeholder: "Password",
                              sfSymbol: nil,
                              sfSymbolColor: .black)
            .preview(with: "Input Password View without sfsymbol")
        }
    }
}
