//
//  SQLTextView.swift
//  DissertationProject2023
//
//  Created by Louis on 18/04/2023.
//

import SwiftUI
import UIKit

struct SQLTextView: View {
    
    let sqlCode: String
    
    var body: some View {
        
        SQLCodeDisplayer(sqlCode: sqlCode)
        
    }
}


struct SQLCodeDisplayer: View {
    let sqlCode: String
    let highlightedKeywords: Set<String> = [
        "SELECT", "FROM", "WHERE", "INSERT", "UPDATE", "DELETE", "JOIN", "ORDER BY", "GROUP BY", "AND", "OR"
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: true) {
            HStack(alignment: .top) {
                HighlightedText(
                    text: sqlCode,
                    highlightedKeywords: highlightedKeywords,
                    textColor: .white,
                    highlightColor: .green,
                    stringColor: .red,
                    commentColor: .gray
                )
                .font(.system(.body, design: .monospaced))
                .padding()
            }
        }
        .background(Color.black)
        .cornerRadius(10)
    }
}

struct HighlightedText: View {
    let text: String
    let highlightedKeywords: Set<String>
    let textColor: Color
    let highlightColor: Color
    let stringColor: Color
    let commentColor: Color
    
    @ViewBuilder
    var body: some View {
        let tokens = text.split(separator: " ", omittingEmptySubsequences: false)
        
        ForEach(tokens.indices, id: \.self) { index in
            let token = tokens[index]
            let trimmedToken = token.trimmingCharacters(in: .whitespaces)
            
            if highlightedKeywords.contains(trimmedToken.uppercased()) {
                Text(token)
                    .foregroundColor(highlightColor)
            } else if token.starts(with: "'") || token.starts(with: "\"") {
                if index == tokens.count - 1 && token.last == ";" {
                    let stringWithoutSemicolon = token.dropLast()
                    Text(stringWithoutSemicolon)
                        .foregroundColor(stringColor)
                    
                    Text(";")
                        .foregroundColor(textColor)
                } else {
                    Text(token)
                        .foregroundColor(stringColor)
                }
            } else if token.starts(with: "--") || token.starts(with: "/*") {
                Text(token)
                    .foregroundColor(commentColor)
            } else {
                Text(token)
                    .foregroundColor(textColor)
            }
        }
    }
}






struct SQLTextView_Previews: PreviewProvider {
    static var previews: some View {
        SQLTextView(sqlCode: "SELECT * FROM users WHERE username = 'john_doe' AND age > 18; /*OR1=1")
    }
}
