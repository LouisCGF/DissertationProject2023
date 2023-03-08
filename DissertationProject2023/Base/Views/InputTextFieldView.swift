//
//  InputTextFieldView.swift
//  DissertationProject2023
//
//  Created by Louis on 03/03/2023.
//

import SwiftUI

struct InputTextFieldView: View {
    
    @Binding var text: String
    let placeholder: String
    let keyboardType: UIKeyboardType
    let sfSymbol: String?
    let sfSymbolColor: Color?
    
    private let textFieldLeading: CGFloat = 30
    @FocusState private var fieldIsFocused: Bool
    
    var body: some View {
        TextField(placeholder, text: $text)
            .frame(maxWidth: .infinity,
            minHeight: 50)
            .padding(.leading, sfSymbol == nil ? textFieldLeading / 2 : textFieldLeading)
            .keyboardType(keyboardType)
            .focused($fieldIsFocused)
            .background(
            
                ZStack (alignment: .leading) {
                    
                    if let systemImage = sfSymbol {
                        
                        Image(systemName: systemImage)
                            .font(.system(size: 16, weight: .semibold))
                            .padding(.leading, 5)
                            .foregroundColor(sfSymbolColor?.opacity(fieldIsFocused ? 1 : 0.5))
                        
                    }
                    
                    RoundedRectangle(cornerRadius: 10,
                                     style: .continuous)
                        .stroke(Color.gray.opacity(fieldIsFocused ? 1 : 0.5))
                    
                }
            )
    }
}

struct InputTextFieldView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        Group {
            InputTextFieldView(text: .constant(""),
                               placeholder: "Email",
                               keyboardType: .emailAddress,
                               sfSymbol: "envelope",
                               sfSymbolColor: .black)
            .preview(with: "Email Text Input with sfsymbol")
            
            InputTextFieldView(text: .constant(""),
                               placeholder: "First Name",
                               keyboardType: .default,
                               sfSymbol: nil,
                               sfSymbolColor: nil)
            .preview(with: "First Name Text Inout with sfsymbol")
        }
        

    }
}
