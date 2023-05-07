//
//  PCPage4.swift
//  DissertationProject2023
//
//  Created by Louis on 07/05/2023.
//

import SwiftUI

struct PCPage4: View {
    let q1Answers = ["Brute Force", "Dictionary Attack", "Phishing Attack", "Hybrid Attack"]
    
    let q2Answers = [ "A colorful table used to store a list of passwords", "A precomputed table containing hash values of character combinations", "A table containing a list of common passwords", "A table that visually represents the progress of a brute force attack" ]
    
    let q3Answers = ["Straight (Dictionary) Attack", "Brute Force Attack", "DDoS Attack", "Hybrid Attack"]
    
    let q4Answers = ["Reduces the storage space required for wordlists", "Increases the speed of password cracking by utilising parallel processing capabilities", "Improves the user interface of the tool", "Provides support for more hashing algorithms"]
    
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
                    HeadingTextView(text: "Check Your Understanding", colour: Color(.systemTeal))
                    
                    SubheadingView(text: "Which of the following is NOT a common password cracking technique?")
                    
                    QuestionView(selectedAnswer: $q1SelectedAnswer, textColour: $q1TextColour, correctAnswer: q1Answers[2], correctAnswerColor: $q1CorrectAnswerColour, selectedAnswerColor: $q1SelectedAnswerColour, answers: q1Answers)
                    
                    SubheadingView(text: "In the context of password cracking, what is a rainbow table?")
                    
                    QuestionView(selectedAnswer: $q2SelectedAnswer, textColour: $q2TextColour, correctAnswer: q2Answers[1], correctAnswerColor: $q2CorrectAnswerColour, selectedAnswerColor: $q2SelectedAnswerColour, answers: q2Answers)
                    
                    SubheadingView(text: "Which of the following attack modes is NOT supported by Hashcat?")
                    
                    QuestionView(selectedAnswer: $q3SelectedAnswer, textColour: $q3TextColour, correctAnswer: q3Answers[2], correctAnswerColor: $q3CorrectAnswerColour, selectedAnswerColor: $q3SelectedAnswerColour, answers: q3Answers)
                    
                    SubheadingView(text: "What is the primary advantage of using GPU acceleration in Hashcat?")
                    
                    QuestionView(selectedAnswer: $q4SelectedAnswer, textColour: $q4TextColour, correctAnswer: q4Answers[1], correctAnswerColor: $q4CorrectAnswerColour, selectedAnswerColor: $q4SelectedAnswerColour, answers: q4Answers)
                    
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
        
        if q1SelectedAnswer != q1Answers[2] {
            q1SelectedAnswerColour = Color(.red)
        }
        
        if q2SelectedAnswer != q2Answers[1] {
            q2SelectedAnswerColour = Color(.red)
        }
        
        if q3SelectedAnswer != q3Answers[2] {
            q3SelectedAnswerColour = Color(.red)
        }
        
        if q4SelectedAnswer != q4Answers[1] {
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

struct PCPage4_Previews: PreviewProvider {
    static var previews: some View {
        PCPage4()
    }
}
