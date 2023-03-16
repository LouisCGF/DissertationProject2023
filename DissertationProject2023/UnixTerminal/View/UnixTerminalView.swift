//
//  UnixTerminalView.swift
//  DissertationProject2023
//
//  Created by Louis on 16/03/2023.
//

import SwiftUI

struct UnixTerminalView: View {
    
    @FocusState private var fieldIsFocused: Bool
    
    @State var inputCmd = ""
    @State var output = ""
    
    let allowedCmds: [String] = ["nmap", "nmap -h", "nmap google.com", "nmap 142.250.187.238", "nmap -v google.com", "nmap -v 142.250.187.238"]
    
    var body: some View {
        
        VStack (alignment: .leading) {
  
            TextField("", text: $inputCmd)
                .frame(maxWidth: .infinity,
                minHeight: 50)
                .padding(.leading, 30)
                .keyboardType(.asciiCapable)
                .focused($fieldIsFocused)
                .foregroundColor(.green)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .onSubmit {
                    runCmd()
                    inputCmd = ""
                }
                .background(
                
                    ZStack (alignment: .leading) {
                        
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.black)
                        
                        Image(systemName: "greaterthan")
                            .font(.system(size: 16, weight: .semibold))
                            .padding(.leading, 5)
                            .foregroundColor(.green.opacity(fieldIsFocused ? 1 : 0.5))
            
                        
                    }
                )
            
            ZStack (alignment: .leading) {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.black)
                    .frame(maxHeight: 700)
                
                ScrollView (.vertical) {
                    Text(output)
                        .font(.footnote)
                        .foregroundColor(.green)
                        .padding()
                }

            }
            

        }
        .padding()

  
    }
    
    func runCmd() {
        
        let date = Date()
        let dateFormatter = DateFormatter()
        let dateFormatter2 = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss z"
        dateFormatter2.dateFormat = "HH:mm"

        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter2.timeZone = TimeZone(abbreviation: "UTC")
        let currentTimeAndDate = dateFormatter.string(from: date) // <- format: 2019-01-10 00:24:12 GMT
        let currentTime = dateFormatter2.string(from: date) // <- format: 00:24
        
        let strippedInputCmd = inputCmd.trimmingCharacters(in: .whitespaces) // <- Remove trailing and leading whitespace from input command
        
        if strippedInputCmd == "" {
            return
        }
        
        if allowedCmds.contains(strippedInputCmd) { // <- Check if command is valid
            
            switch (strippedInputCmd) {
            case "nmap", "nmap -h":
                output = "Nmap 7.93 ( https://nmap.org )\nUsage: nmap [Scan Type(s)] [Options] {target specification}\nEXAMPLES:\n  nmap -v -A scanme.nmap.org\n  nmap -v -sn 192.168.0.0/16 10.0.0.0/8\n  nmap -v -iR 10000 -Pn -p 80\nSEE THE MAN PAGE (https://nmap.org/book/man.html) FOR MORE OPTIONS AND EXAMPLES"
                
            case "nmap google.com", "nmap 142.250.187.238":

                output = "Starting Nmap 7.93 ( https://nmap.org ) at \(dateFormatter.string(from: date))\nNmap scan report for google.com (142.250.187.238)\nHost is up (0.0092s latency).\nrDNS record for 142.250.187.238: lhr25s34-in-f14.1e100.net\nNot shown: 998 filtered tcp ports (no-response)\nPORT    STATE SERVICE\n80/tcp  open  http\n443/tcp open  https\n\nNmap done: 1 IP address (1 host up) scanned in 0.1 seconds"
                
            case "nmap -v google.com", "nmap -v 142.250.187.238":

                output = "Starting Nmap 7.93 ( https://nmap.org ) at \(currentTimeAndDate)\nInitiating Ping Scan at \(currentTime)\nScanning google.com (142.250.187.206) [2 ports]\nCompleted Ping Scan at \(currentTime), 0.01s elapsed (1 total hosts)\nInitiating Parallel DNS resolution of 1 host. at \(currentTime)\nCompleted Parallel DNS resolution of 1 host. at \(currentTime), 0.01s elapsed\nInitiating Connect Scan at \(currentTime)\nScanning google.com (142.250.187.206) [1000 ports]\nDiscovered open port 443/tcp on 142.250.187.206\nDiscovered open port 80/tcp on 142.250.187.206\nCompleted Connect Scan at \(currentTime), 0.9s elapsed (1000 total ports)\nNmap scan report for google.com (142.250.187.206)\nHost is up (0.0089s latency).\nrDNS record for 142.250.187.206: lhr25s33-in-f14.1e100.net\nNot shown: 998 filtered tcp ports (no-response)\nPORT    STATE SERVICE\n80/tcp  open  http\n443/tcp open  https\n\nRead data files from: /usr/local/bin/../share/nmap\nNmap done: 1 IP address (1 host up) scanned in 1.1 seconds"
            default:
                return
            }
        } else if strippedInputCmd.contains("nmap") { // <- If the user malforms the nmap command output the nmap help page - same behaviour as real nmap
            output = "Nmap 7.93 ( https://nmap.org )\nUsage: nmap [Scan Type(s)] [Options] {target specification}\nEXAMPLES:\n  nmap -v -A scanme.nmap.org\n  nmap -v -sn 192.168.0.0/16 10.0.0.0/8\n  nmap -v -iR 10000 -Pn -p 80\nSEE THE MAN PAGE (https://nmap.org/book/man.html) FOR MORE OPTIONS AND EXAMPLES"
        } else {
            output = "command not found: \(strippedInputCmd)"
        }
    }
    
}

struct UnixTerminalView_Previews: PreviewProvider {
    static var previews: some View {
        UnixTerminalView()
    }
}
