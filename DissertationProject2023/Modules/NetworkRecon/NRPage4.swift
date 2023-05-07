//
//  NRPage4.swift
//  DissertationProject2023
//
//  Created by Louis on 07/05/2023.
//

import SwiftUI

struct NRPage4: View {
    let q1Answers = ["To launch a cyber attack on a target network.", "To gather information about a target network or system to identify potential vulnerabilities and weaknesses.", "To repair damaged network infrastructure.", "To advertise a target network or system to the public."]
    
    let q2Answers = [ "nmap -sV [target IP range]", "nmap -O [target IP range]", "nmap -sn [target IP range]", "nmap [target IP range]" ]
    
    let q3Answers = ["Host Discovery", "Port Scanning", "Version Detection", "OS Detection"]
    
    let q4Answers = ["Passive reconnaissance involves direct interaction with the target network, while active reconnaissance does not.", "Passive reconnaissance is performed by network administrators, while active reconnaissance is performed by hackers.", "Passive reconnaissance involves collecting information without directly interacting with the target network, while active reconnaissance involves direct interaction with the target network.", "Passive reconnaissance is illegal, while active reconnaissance is legal."]
    
    @State var q1SelectedAnswer = ""
    @State var q2SelectedAnswer = ""
    @State var q3SelectedAnswer = ""
    @State var q4SelectedAnswer = ""
    
    @State var q1TextColour = Color(.black)
    @State var q2TextColour = Color(.black)
    @State var q3TextColour = Color(.black)
    @State var q4TextColour = Color(.black)
    
    @State var q1CorrectAnswerColour = Color(.black)
    @State var q2CorrectAnswerColour = Color(.black)
    @State var q3CorrectAnswerColour = Color(.black)
    @State var q4CorrectAnswerColour = Color(.black)
    
    @State var q1SelectedAnswerColour = Color(.black)
    @State var q2SelectedAnswerColour = Color(.black)
    @State var q3SelectedAnswerColour = Color(.black)
    @State var q4SelectedAnswerColour = Color(.black)
    
    @State var endText = ""
    
    var body: some View {
        
        ScrollView(.vertical){
            VStack (alignment: .leading){
                
                Group {
                    HeadingTextView(text: "Check Your Understanding", colour: Color(.systemPink))
                    
                    SubheadingView(text: "What is the primary purpose of network reconnaissance?")
                    
                    QuestionView(selectedAnswer: $q1SelectedAnswer, textColour: $q1TextColour, correctAnswer: q1Answers[1], correctAnswerColor: $q1CorrectAnswerColour, selectedAnswerColor: $q1SelectedAnswerColour, answers: q1Answers)
                    
                    SubheadingView(text: "Which NMAP command is used to perform a ping sweep?")
                    
                    QuestionView(selectedAnswer: $q2SelectedAnswer, textColour: $q2TextColour, correctAnswer: q2Answers[2], correctAnswerColor: $q2CorrectAnswerColour, selectedAnswerColor: $q2SelectedAnswerColour, answers: q2Answers)
                    
                    SubheadingView(text: "Which of the following NMAP features helps to identify the operating system of a target host?")
                    
                    QuestionView(selectedAnswer: $q3SelectedAnswer, textColour: $q3TextColour, correctAnswer: q3Answers[3], correctAnswerColor: $q3CorrectAnswerColour, selectedAnswerColor: $q3SelectedAnswerColour, answers: q3Answers)
                    
                    SubheadingView(text: "What is the main difference between passive and active network reconnaissance?")
                    
                    QuestionView(selectedAnswer: $q4SelectedAnswer, textColour: $q4TextColour, correctAnswer: q4Answers[2], correctAnswerColor: $q4CorrectAnswerColour, selectedAnswerColor: $q4SelectedAnswerColour, answers: q4Answers)
                    
                    Text(endText)
                }
                
                ButtonView(title: "Check Answers", background: .black, foreground: .white){
                    checkAnswers()
                }
                
            }
            .padding()
            .foregroundColor(.black)
        }
        .background(.white)
    }
    
    private func checkAnswers() {
        
        if ( q1SelectedAnswer == "" || q2SelectedAnswer == "" || q3SelectedAnswer == "" || q4SelectedAnswer == "" ){
            endText = "Please answer all questions"
            return
        }
        
        endText = ""
        
        q1CorrectAnswerColour = Color(.green)
        q2CorrectAnswerColour = Color(.green)
        q3CorrectAnswerColour = Color(.green)
        q4CorrectAnswerColour = Color(.green)
        
        if q1SelectedAnswer != q1Answers[1] {
            q1SelectedAnswerColour = Color(.red)
        }
        
        if q2SelectedAnswer != q2Answers[2] {
            q2SelectedAnswerColour = Color(.red)
        }
        
        if q3SelectedAnswer != q3Answers[3] {
            q3SelectedAnswerColour = Color(.red)
        }
        
        if q4SelectedAnswer != q4Answers[2] {
            q4SelectedAnswerColour = Color(.red)
        }
        
    }
}

private struct QuestionView: View {
    
    @Binding var selectedAnswer: String
    @Binding var textColour: Color
    @State var correctAnswer: String
    @Binding var correctAnswerColor: Color
    @Binding var selectedAnswerColor: Color
    let answers: [String]
    
    
    var body: some View {
        
        NavigationView {
            Form {
                Picker("", selection: $selectedAnswer) {
                    ForEach(answers, id: \.self) { item in
                        if (item == correctAnswer){
                            Text(item)
                                .foregroundColor(correctAnswerColor)
                            
                        } else if (item == selectedAnswer){
                            Text(item)
                                .foregroundColor(selectedAnswerColor)
                        }
                        else {
                            Text(item)
                                .foregroundColor(textColour)
                        }

                    }
                }
                .pickerStyle(.inline)
            }
        }
        .padding(.bottom, 10)
        .frame(height: 350)
   
    }
  
}

struct NRPage4_Previews: PreviewProvider {
    static var previews: some View {
        NRPage4()
    }
}
