//
//  LEPage6.swift
//  DissertationProject2023
//
//  Created by Louis on 07/05/2023.
//

import SwiftUI

struct LEPage6: View {
    let q1Answers = ["The Cybersecurity Information Sharing Act (CISA)", "The Computer Fraud and Abuse Act (CFAA)", "The Electronic Communications Privacy Act (ECPA)", "The Digital Millennium Copyright Act (DMCA)"]
    
    let q2Answers = [ "Act in the best interest of clients and the public.", "Maintain integrity and professionalism.", "Provide accurate and unbiased information.", "Exploit vulnerabilities for personal gain." ]
    
    let q3Answers = ["To serve as proof of authorization and protect both parties from legal issues.", "To establish a timeline for the test.", "To determine the testing techniques to be used.", "To share the findings of the test with third parties."]
    
    let q4Answers = ["Executive Summary", "Methodology", "Detailed Findings", "Client's Budget and Financial Information"]
    
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
                    HeadingTextView(text: "Check Your Understanding", colour: Color(.systemYellow))
                    
                    SubheadingView(text: "Which United States federal law prohibits unauthorized access to computer ")
                    
                    QuestionView(selectedAnswer: $q1SelectedAnswer, textColour: $q1TextColour, correctAnswer: q1Answers[1], correctAnswerColor: $q1CorrectAnswerColour, selectedAnswerColor: $q1SelectedAnswerColour, answers: q1Answers)
                    
                    SubheadingView(text: "Which principle is NOT part of the OWASP Code of Ethics?")
                    
                    QuestionView(selectedAnswer: $q2SelectedAnswer, textColour: $q2TextColour, correctAnswer: q2Answers[3], correctAnswerColor: $q2CorrectAnswerColour, selectedAnswerColor: $q2SelectedAnswerColour, answers: q2Answers)
                    
                    SubheadingView(text: "What is the primary purpose of obtaining written consent before performing a penetration test?")
                    
                    QuestionView(selectedAnswer: $q3SelectedAnswer, textColour: $q3TextColour, correctAnswer: q3Answers[0], correctAnswerColor: $q3CorrectAnswerColour, selectedAnswerColor: $q3SelectedAnswerColour, answers: q3Answers)
                    
                    SubheadingView(text: "Which component is NOT part of a comprehensive penetration testing report?")
                    
                    QuestionView(selectedAnswer: $q4SelectedAnswer, textColour: $q4TextColour, correctAnswer: q4Answers[3], correctAnswerColor: $q4CorrectAnswerColour, selectedAnswerColor: $q4SelectedAnswerColour, answers: q4Answers)
                    
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
        
        if q2SelectedAnswer != q2Answers[3] {
            q2SelectedAnswerColour = Color(.red)
        }
        
        if q3SelectedAnswer != q3Answers[0] {
            q3SelectedAnswerColour = Color(.red)
        }
        
        if q4SelectedAnswer != q4Answers[3] {
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

struct LEPage6_Previews: PreviewProvider {
    static var previews: some View {
        LEPage6()
    }
}
