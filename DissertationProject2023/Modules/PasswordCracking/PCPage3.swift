//
//  PCPage3.swift
//  DissertationProject2023
//
//  Created by Louis on 20/04/2023.
//

import SwiftUI

struct PCPage3: View {
    
    private let passwordCrackingData = ModelData().passwordCrackingData[0]
    
    @State var showTerminalDescription = false
    @State var showCommandFlag = false
    @State var showCommandFlagDescription = false
    @State var showHashes = false
    @State var showHashesDescription = false
    @State var showHashcatCommand = false
    @State var inputCmd = ""
    
    @State var descriptionText = "You're going to use it to practice basic Hashcat commands. Begin by simply typing 'hashcat' in the terminal and press enter."
    
    @State var endText = ""
    
    var body: some View {
        
        ScrollView (.vertical) {
            VStack (alignment: .leading){
                
                HeadingTextView(text: "Using Hashcat", colour: Color(.systemTeal))
                
                HStack {
                    SubheadingView(text: "Below is a simulated")
                    SubheadingView(text: "Unix terminal")
                        .foregroundColor(.blue)
                        .onTapGesture {
                            showTerminalDescription = true
                        }
                        .alert(isPresented: $showTerminalDescription){
                            Alert(title: Text("What is a Unix terminal?"), message: Text(passwordCrackingData.section3_1), dismissButton: .default(Text("Got it")))
                        }
                }
                
                SubheadingView(text: passwordCrackingData.section3_2)
                
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
                            Alert(title: Text("What is a command flag?"), message: Text(passwordCrackingData.section3_3), dismissButton: .default(Text("Got it")))
                        }
                    
                    SubheadingView(text: passwordCrackingData.section3_6)
                     

                    
                } else if (showHashes) {
                    
                    SubheadingView(text: descriptionText)
                        .padding(.top, 10)
                    
                    SubheadingView(text: "What is a hashed password?")
                        .foregroundColor(.blue)
                        .onTapGesture {
                            showHashesDescription = true
                        }
                        .alert(isPresented: $showHashesDescription){
                            Alert(title: Text("What is a command flag?"), message: Text(passwordCrackingData.section3_5), dismissButton: .default(Text("Got it")))
                        }
                    
                    SubheadingView(text: passwordCrackingData.section3_7)
                    
                } else if (showHashcatCommand) {
                    
                    SubheadingView(text: descriptionText)
                        .padding(.top, 10)
                    
                    (
                        Text("hashcat")
                        +
                        Text(" -a")
                            .foregroundColor(.pink)
                        +
                        Text(" 0")
                            .foregroundColor(.yellow)
                        +
                        Text(" -m")
                            .foregroundColor(.pink)
                        +
                        Text(" 0")
                            .foregroundColor(.yellow)
                        +
                        Text(" hashes.txt commonpasswords.txt")
                            .foregroundColor(.green)
                    )
                    .font(.system(size: 10, design: .monospaced))
                    .padding()
                    .background(.black)
                    .cornerRadius(15)
                    .foregroundColor(.white)
                    
                    SubheadingView(text: passwordCrackingData.section3_8)
                        .padding(.top, 5)
                             
                }
                else {
                    SubheadingView(text: descriptionText)
                        .padding(.top, 10)
                }
                 
                
                UnixTerminalView(inputCmd: $inputCmd)
                    .onSubmit {
                        evaluateCmd()
                    }
                
                SubheadingView(text: endText)
                
            }
            .padding()
            .foregroundColor(.black)
        }
        .background(.white)
        
    }
    
    private func evaluateCmd() {
        
        showCommandFlag = false
        showHashes = false
        showHashcatCommand = false
        
        switch (inputCmd) {
        case "hashcat", "hashcat --help":
            descriptionText = passwordCrackingData.section3_4
            showCommandFlag = true
            
        case "ls":
            descriptionText = passwordCrackingData.section3_9
            showHashes = true
            
        case "cat hashes.txt":
            descriptionText = passwordCrackingData.section3_10
            
        case "cat commonpasswords.txt":
            showHashcatCommand = true
            descriptionText = passwordCrackingData.section3_11
            
        case "hashcat -a 0 -m 0 hashes.txt commonpasswords.txt":
            descriptionText = passwordCrackingData.section3_12
            
            endText = passwordCrackingData.section3_13
            
        case "clear":
            descriptionText = passwordCrackingData.section3_14
            
        default:
            descriptionText = passwordCrackingData.section3_15
        }
        
    }
}

struct PCPage3_Previews: PreviewProvider {
    static var previews: some View {
        PCPage3()
    }
}
