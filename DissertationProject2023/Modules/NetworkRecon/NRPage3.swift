//
//  NRPage3.swift
//  DissertationProject2023
//
//  Created by Louis on 20/04/2023.
//

import SwiftUI

struct NRPage3: View {
    
    private let networkReconData = ModelData().networkReconData[0]
    
    @State var showTerminalDescription = false
    @State var showCommandFlag = false
    @State var showCommandFlagDescription = false
    @State var inputCmd = ""
    
    @State var descriptionText = "You're going to use it to practice basic NMAP commands. Begin by simply typing 'nmap' in the terminal and press enter."
    @State var congratsText = ""
    
    var body: some View {
        
        ScrollView (.vertical){
            VStack (alignment: .leading){
                
                HeadingTextView(text: "NMAP: Practice basic commands", colour: Color(.systemPink))
                
                HStack {
                    SubheadingView(text: "Below is a simulated")
                    SubheadingView(text: "Unix terminal")
                        .foregroundColor(.blue)
                        .onTapGesture {
                            showTerminalDescription = true
                        }
                        .alert(isPresented: $showTerminalDescription){
                            Alert(title: Text("What is a Unix terminal?"), message: Text(networkReconData.section3_1), dismissButton: .default(Text("Got it")))
                        }
                }
                
                SubheadingView(text: networkReconData.section3_2)
                
                Divider()
                
                
                
                if (showCommandFlag) {
                    
                    
                    
                    SubheadingView(text: descriptionText)
                        .padding(.top, 10)
                    
                    SubheadingView(text: "What is a command flag?")
                        .foregroundColor(.blue)
                        .onTapGesture {
                            showCommandFlagDescription = true
                        }
                        .alert(isPresented: $showCommandFlagDescription){
                            Alert(title: Text("What is a command flag?"), message: Text(networkReconData.section3_3), dismissButton: .default(Text("Got it")))
                        }
                    
                    SubheadingView(text: networkReconData.section3_4)
                     

                    
                } else {
                    SubheadingView(text: descriptionText)
                        .padding(.top, 10)
                }
                
                UnixTerminalView(inputCmd: $inputCmd)
                    .onSubmit {
                        evaluateCmd()
                    }
                
                SubheadingView(text: congratsText)
    
            }
            .padding()
            .foregroundColor(.black)
        }
        .background(.white)
    }
    
    private func evaluateCmd() {
        
        showCommandFlag = false
        
        switch (inputCmd){
            
        case "nmap", "nmap -h":
            descriptionText = networkReconData.section3_5
            showCommandFlag = true
            
        case "nmap google.com":
            descriptionText = networkReconData.section3_6
            
        case "nmap 142.250.187.238":
            descriptionText = networkReconData.section3_7
            
        case "nmap -v 142.250.187.238", "nmap -v google.com":
            descriptionText = networkReconData.section3_8
            
        case "nmap -O 142.250.187.238", "nmap -O google.com":
            descriptionText = networkReconData.section3_9
            congratsText = networkReconData.section3_10
            
        case "clear":
            descriptionText = networkReconData.section3_11
            
        default:
            descriptionText = networkReconData.section3_12
            
        }
    }
}

struct NRPage3_Previews: PreviewProvider {
    static var previews: some View {
        NRPage3()
    }
}
