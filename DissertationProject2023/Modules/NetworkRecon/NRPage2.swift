//
//  NRPage2.swift
//  DissertationProject2023
//
//  Created by Louis on 19/04/2023.
//

import SwiftUI

struct NRPage2: View {
    
    private let networkReconData = ModelData().networkReconData[0]
    
    var body: some View {
        
        ScrollView (.vertical){
            VStack (alignment: .leading){
                
                Group {
                    HeadingTextView(text: "NMAP: A Brief Overview", colour: Color(.systemPink))
                    
                    SubheadingView(text: networkReconData.section2_1)
                    
                    SubheadingView(text: "1. Host Discovery")
                        .fontWeight(.bold)
                    
                    SubheadingView(text: networkReconData.section2_2)
                        .padding()
                    
                    SubheadingView(text: "2. Port Scanning")
                        .fontWeight(.bold)
                    
                    SubheadingView(text: networkReconData.section2_3)
                        .padding()
                    
                    SubheadingView(text: "3. Version Detection")
                        .fontWeight(.bold)
                    
                    SubheadingView(text: networkReconData.section2_4)
                        .padding()
                    
                    SubheadingView(text: "4. OS Detection")
                        .fontWeight(.bold)
                    
                    SubheadingView(text: networkReconData.section2_5)
                        .padding()
                }
                
                Group {
                    SubheadingView(text: "5. Scriptable Interaction")
                        .fontWeight(.bold)
                    
                    SubheadingView(text: networkReconData.section2_6)
                        .padding()
                    
                    SubheadingView(text: "6. Output Formats")
                        .fontWeight(.bold)
                    
                    SubheadingView(text: networkReconData.section2_7)
                        .padding()
                    
                    HeadingTextView(text: "Getting Started with NMAP", colour: Color(.systemRed))
                    
                    SubheadingView(text: networkReconData.section2_8)
                    
                    SubheadingView(text: "Basic NMAP Commands\n")
                        .fontWeight(.bold)
                    
                    SubheadingView(text: "Before we start scanning, let's familiarise ourselves with a few basic NMAP commands.")
                }
                
                Group {
                    SubheadingView(text: "1. Port Scanning: To scan for open ports on a target host, use the following command:")
                        .padding()
                    
                    NmapCommandsView(commandToDisplay: 1)
                        .padding()
                    
                    SubheadingView(text: "2. Ping Sweep: To discover live hosts within a target network, use the following command:")
                        .padding()
                    
                    NmapCommandsView(commandToDisplay: 2)
                        .padding()
                    
                    SubheadingView(text: "3. Version Detection: To identify the services and their versions running on a target host, use the following command:")
                        .padding()
                    
                    NmapCommandsView(commandToDisplay: 3)
                        .padding()
                    
                    SubheadingView(text: "4. OS Detection: To determine the operating system of a target host, use the following command:")
                        .padding()
                    
                    NmapCommandsView(commandToDisplay: 4)
                        .padding()
                }
                
                SubheadingView(text: "\nWe'll now move on to practicing some NMAP commands in the simulated terminal on the next page...")
                
            }
            .padding()
            .foregroundColor(.black)
        }
        .background(.white)
        
    }
}

struct NRPage2_Previews: PreviewProvider {
    static var previews: some View {
        NRPage2()
    }
}
