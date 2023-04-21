//
//  UnixTerminalView.swift
//  DissertationProject2023
//
//  Created by Louis on 16/03/2023.
//

import SwiftUI

struct UnixTerminalView: View {
    
    @FocusState private var fieldIsFocused: Bool
    
    @Binding var inputCmd: String // <- For production
    //@State var inputCmd = "" // <- For testing
    @State var output = "\n\n\n\n\n\n\n\n\n"
    
    let allowedCmds: [String] = ["nmap", "nmap -h", "nmap google.com", "nmap 142.250.187.238", "nmap -v google.com", "nmap -v 142.250.187.238", "nmap -O 142.250.187.238", "nmap -O google.com", "hashcat", "hashcat --help", "cat hashes.txt", "cat commonpasswords.txt", "hashcat -a 0 -m 0 hashes.txt commonpasswords.txt", "hashcat -a", "ls", "clear"]
    
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

                output = "Starting Nmap 7.93 ( https://nmap.org ) at \(currentTimeAndDate))\nNmap scan report for google.com (142.250.187.238)\nHost is up (0.0092s latency).\nrDNS record for 142.250.187.238: lhr25s34-in-f14.1e100.net\nNot shown: 998 filtered tcp ports (no-response)\nPORT    STATE SERVICE\n80/tcp  open  http\n443/tcp open  https\n\nNmap done: 1 IP address (1 host up) scanned in 0.1 seconds"
                
            case "nmap -v google.com", "nmap -v 142.250.187.238":

                output = "Starting Nmap 7.93 ( https://nmap.org ) at \(currentTimeAndDate)\nInitiating Ping Scan at \(currentTime)\nScanning google.com (142.250.187.206) [2 ports]\nCompleted Ping Scan at \(currentTime), 0.01s elapsed (1 total hosts)\nInitiating Parallel DNS resolution of 1 host. at \(currentTime)\nCompleted Parallel DNS resolution of 1 host. at \(currentTime), 0.01s elapsed\nInitiating Connect Scan at \(currentTime)\nScanning google.com (142.250.187.206) [1000 ports]\nDiscovered open port 443/tcp on 142.250.187.206\nDiscovered open port 80/tcp on 142.250.187.206\nCompleted Connect Scan at \(currentTime), 0.9s elapsed (1000 total ports)\nNmap scan report for google.com (142.250.187.206)\nHost is up (0.0089s latency).\nrDNS record for 142.250.187.206: lhr25s33-in-f14.1e100.net\nNot shown: 998 filtered tcp ports (no-response)\nPORT    STATE SERVICE\n80/tcp  open  http\n443/tcp open  https\n\nRead data files from: /usr/local/bin/../share/nmap\nNmap done: 1 IP address (1 host up) scanned in 1.1 seconds"
                
            case "nmap -O google.com", "nmap -O 142.250.187.238":
                output = "Starting Nmap 7.93 ( https://nmap.org ) at \(currentTimeAndDate)\nNmap scan report for google.com (142.250.187.238)\nHost is up (0.037s latency).\nrDNS record for 142.250.187.238: lhr25s34-in-f14.1e100.net\nNot shown: 998 filtered tcp ports (no-response)\nPORT    STATE SERVICE\n80/tcp  open  http\n443/tcp open  https\nWarning: OSScan results may be unreliable because we could not find at least 1 open and 1 closed port\nDevice type: general purpose|WAP|specialized\nRunning (JUST GUESSING): OpenBSD 4.X (87%), Linux 2.6.X (85%), Crestron 2-Series (85%)\nOS CPE: cpe:/o:openbsd:openbsd:4.3 cpe:/o:linux:linux_kernel:2.6.22 cpe:/o:crestron:2_series\nAggressive OS guesses: OpenBSD 4.3 (87%), OpenWrt Kamikaze 7.09 (Linux 2.6.22) (85%), Crestron XPanel control system (85%)\nNo exact OS matches for host (test conditions non-ideal).\n\nOS detection performed. Please report any incorrect results at https://nmap.org/submit/ .\nNmap done: 1 IP address (1 host up) scanned in 10.77 seconds"
                
            case "hashcat", "hashcat --help":
                output = "hashcat (v6.2.6) starting in help mode\n\nUsage: hashcat [options]... hash|hashfile|hccapxfile [dictionary|mask|directory]...\n\n- [ License ] -\n\nhashcat is licensed under the MIT license\nCopyright and license terms are listed in docs/license.txt\n\n- [ Basic Examples ] -\n\nAttack-          | Hash- |\nMode             | Type  | Example command\n==================+=======+==================================================================\nWordlist         | $P$   | hashcat -a 0 -m 400 example400.hash example.dict\nWordlist + Rules | MD5   | hashcat -a 0 -m 0 example0.hash example.dict -r rules/best64.rule\nBrute-Force      | MD5   | hashcat -a 3 -m 0 example0.hash ?a?a?a?a?a?a\nCombinator       | MD5   | hashcat -a 1 -m 0 example0.hash example.dict example.dict\nAssociation      | $1$   | hashcat -a 9 -m 500 example500.hash 1word.dict -r rules/best64.rule"
                
            case "cat hashes.txt":
                output = "482c811da5d5b4bc6d497ffa98491e38\ne10adc3949ba59abbe56e057f20f883e\n37b4e2d82900d5e94b8da524fbeb33c0\nf25a2fc72690b780b2a14e140ef6a9e0"
                
            case "cat commonpasswords.txt":
                output = "123456\n12345\n123456789\npassword\niloveyou\nprincess\n1234567\nfootball\nrockyou\n12345678\npassword123\nsecret"
                
            case "hashcat -a 0 -m 0 hashes.txt commonpasswords.txt":
                output = "hashcat (v6.2.6) starting\n\nHost memory required for this attack: 2 MB\n\nDictionary cache built:\n* Filename..: commonpasswords.txt\n* Passwords.: 12\n* Bytes.....: 104\n* Keyspace..: 12\n* Runtime...: 0 secs\n\n482c811da5d5b4bc6d497ffa98491e38:password123\ne10adc3949ba59abbe56e057f20f883e:123456\n37b4e2d82900d5e94b8da524fbeb33c0:football\nf25a2fc72690b780b2a14e140ef6a9e0:iloveyou\n\nSession..........: hashcat\nStatus...........: Cracked\nHash.Mode........: 0 (MD5)\nHash.Target......: hashes.txt\nTime.Started.....: []\nTime.Estimated...: []"
                
            case "ls":
                output = "hashes.txt\ncommonpasswords.txt"
                
            case "clear":
                output = "\n\n\n\n\n\n\n\n\n"
                
            default:
                return
            }
        } else if strippedInputCmd.contains("nmap") { // <- If the user malforms the nmap command output the nmap help page - same behaviour as real nmap
            output = "Nmap 7.93 ( https://nmap.org )\nUsage: nmap [Scan Type(s)] [Options] {target specification}\nEXAMPLES:\n  nmap -v -A scanme.nmap.org\n  nmap -v -sn 192.168.0.0/16 10.0.0.0/8\n  nmap -v -iR 10000 -Pn -p 80\nSEE THE MAN PAGE (https://nmap.org/book/man.html) FOR MORE OPTIONS AND EXAMPLES"
        } else if (strippedInputCmd.contains("hashcat")) {
            
            output =  "hashcat (v6.2.6) starting in help mode\n\nUsage: hashcat [options]... hash|hashfile|hccapxfile [dictionary|mask|directory]...\n\n- [ License ] -\n\nhashcat is licensed under the MIT license\nCopyright and license terms are listed in docs/license.txt\n\n- [ Basic Examples ] -\n\nAttack-          | Hash- |\nMode             | Type  | Example command\n==================+=======+==================================================================\nWordlist         | $P$   | hashcat -a 0 -m 400 example400.hash example.dict\nWordlist + Rules | MD5   | hashcat -a 0 -m 0 example0.hash example.dict -r rules/best64.rule\nBrute-Force      | MD5   | hashcat -a 3 -m 0 example0.hash ?a?a?a?a?a?a\nCombinator       | MD5   | hashcat -a 1 -m 0 example0.hash example.dict example.dict\nAssociation      | $1$   | hashcat -a 9 -m 500 example500.hash 1word.dict -r rules/best64.rule"
            
        }else {
            output = "command not found: \(strippedInputCmd)"
        }
    }
    
}

struct UnixTerminalView_Previews: PreviewProvider {
    static var previews: some View {
        UnixTerminalView(inputCmd: .constant("")) // <- For production
        //UnixTerminalView() // <- For testing
    }
}
