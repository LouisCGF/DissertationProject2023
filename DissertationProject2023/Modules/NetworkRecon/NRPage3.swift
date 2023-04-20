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
                            Alert(title: Text("What is a Unix terminal?"), message: Text("A Unix terminal, also known as a command-line interface (CLI), is a powerful tool that enables users to interact with Unix-based operating systems (e.g., Linux, macOS) by typing textual commands. It provides greater control and flexibility compared to graphical user interfaces (GUIs), which rely on visual elements like buttons and menus for user interaction. In a Unix terminal, users can perform various tasks, such as navigating the file system, creating and editing files, installing and managing software, and executing scripts or programs. It is especially useful for system administration, programming, and other advanced tasks, as it allows users to automate processes and perform complex operations more efficiently."), dismissButton: .default(Text("Got it")))
                        }
                }
                
                SubheadingView(text: "It has an input field and an output box. A real terminal isn't actually like this, but it is easier to start using it this way.")
                
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
                            Alert(title: Text("What is a command flag?"), message: Text("Command flags, also known as options or switches, are special parameters used in command-line applications to modify or control the behavior of a specific command. Flags usually start with a single hyphen followed by a single letter (e.g., -a) or with two hyphens followed by a longer, descriptive word (e.g., --all). They are entered along with the command to provide additional instructions, customize the output, or enable/disable certain features. Flags can be combined, and some may require an accompanying value to specify the desired behavior further."), dismissButton: .default(Text("Got it")))
                        }
                    
                    SubheadingView(text: "Now let's actually scan a target. Type in 'nmap google.com'")
                     

                    
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
            descriptionText = "As you can see, this brings up the help page for NMAP. Typing 'nmap -h' does the same thing. -h is a command flag."
            showCommandFlag = true
            
        case "nmap google.com":
            descriptionText = "You have just performed a successful NMAP scan of Google. As you can see, Google has two ports open: port 80, or http, and port 443, or https. Google has to have these ports open because these are the standard ports used for web traffic. Port 80 is the default port for HTTP (Hypertext Transfer Protocol), which is used to transmit web pages and other resources between a web server and a user's browser. Port 443 is the default port for HTTPS (HTTP Secure), which is a secure version of HTTP that encrypts data between the server and the browser using SSL/TLS protocols to ensure privacy and data integrity. If we wanted to, we could use other tools to probe these ports and gather more information, but as we are just at the recon stage of our investigation, we'll simply make a note of these ports. We don't usually use URLS (e.g. google.com) with NMAP, we use IP addresses instead. Type in 'nmap 142.250.187.238' now."
            
        case "nmap 142.250.187.238":
            descriptionText = "We get the exact same output. That's because 142.250.187.238 is the IP address of google.com. If we wanted more information when scanning a target, we can increase the verbosity of the scan. We can do this by supplying the '-v' command flag to NMAP. Go ahead and type in 'nmap -v 142.250.187.238' (or 'nmap -v google.com')"
            
        case "nmap -v 142.250.187.238", "nmap -v google.com":
            descriptionText = "We now get a lot more information about what's going on during the scan. We get info about when NMAP connects to the target successfully and when it discovers an open port. Let's do one more scan - an OS detection scan. Finding out what OS a server is running is incredibly usefull. If you know what OS and OS version a server is running, you can exploit known vulnerabilities of that OS. Type 'nmap -O 142.250.187.238' (or 'nmap -O google.com')"
            
        case "nmap -O 142.250.187.238", "nmap -O google.com":
            descriptionText = "NMAP gives us all the info it could find about the OS and version of the server. Since we are scanning Google, they have very good cybersecurity, which results in NMAP having a hard time detecting the exact OS and version. It gives us three possible OSs the server is running as well as the percentage likelyhood of that OS being the correct one."
            congratsText = "Congratulations! You now have a basic understanding of Network Recon and can conduct simple NMAP scans in a Unix terminal."
            
        case "clear":
            descriptionText = "You're going to use it to practice basic NMAP commands. Begin by simply typing 'nmap' in the terminal and press enter."
            
        default:
            descriptionText = "Looks like you entered in the wrong command. Type 'clear' into the terminal to restart"
            
        }
    }
}

struct NRPage3_Previews: PreviewProvider {
    static var previews: some View {
        NRPage3()
    }
}
