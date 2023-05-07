//
//  Page5.swift
//  DissertationProject2023
//
//  Created by Louis on 07/05/2023.
//

import SwiftUI

struct Page5: View {
    
    let q1Answers = ["A method of optimising SQL queries", "A technique used to insert malicious code into an SQL query", "A built-in feature in SQL databases for error handling", "A method for creating database connections"]
    
    let q2Answers = [ "Concatenating user input with SQL queries", "Using prepared statements and parameterized queries", "Storing user input in variables before using them in queries", "Escaping special characters in user input" ]
    
    let q3Answers = ["To make it easier to write raw SQL queries", "To abstract the process of constructing and executing SQL queries, making it more secure", "To provide a command-line interface for executing SQL queries", "To convert SQL queries into a more human-readable format"]
    
    let q4Answers = ["To ensure that user input is in the correct format and free of potentially harmful content", "To improve the performance of SQL queries", "To make it easier to read and understand user input", "To automatically generate SQL queries based on user input"]
    
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
                    HeadingTextView(text: "Check Your Understanding", colour: Color(.systemIndigo))
                    
                    SubheadingView(text: "What is an SQL injection?")
                    
                    QuestionView(selectedAnswer: $q1SelectedAnswer, textColour: $q1TextColour, correctAnswer: q1Answers[1], correctAnswerColor: $q1CorrectAnswerColour, selectedAnswerColor: $q1SelectedAnswerColour, answers: q1Answers)
                    
                    SubheadingView(text: "Which technique is used to separate user-supplied data from the SQL query itself, preventing SQL injections?")
                    
                    QuestionView(selectedAnswer: $q2SelectedAnswer, textColour: $q2TextColour, correctAnswer: q2Answers[1], correctAnswerColor: $q2CorrectAnswerColour, selectedAnswerColor: $q2SelectedAnswerColour, answers: q2Answers)
                    
                    SubheadingView(text: "What is the purpose of an Object-Relational Mapping (ORM) library?")
                    
                    QuestionView(selectedAnswer: $q3SelectedAnswer, textColour: $q3TextColour, correctAnswer: q3Answers[1], correctAnswerColor: $q3CorrectAnswerColour, selectedAnswerColor: $q3SelectedAnswerColour, answers: q3Answers)
                    
                    SubheadingView(text: "Why is it important to validate and sanitize user input?")
                    
                    QuestionView(selectedAnswer: $q4SelectedAnswer, textColour: $q4TextColour, correctAnswer: q4Answers[0], correctAnswerColor: $q4CorrectAnswerColour, selectedAnswerColor: $q4SelectedAnswerColour, answers: q4Answers)
                    
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
        
        if q2SelectedAnswer != q2Answers[1] {
            q2SelectedAnswerColour = Color(.red)
        }
        
        if q3SelectedAnswer != q3Answers[1] {
            q3SelectedAnswerColour = Color(.red)
        }
        
        if q4SelectedAnswer != q4Answers[0] {
            q4SelectedAnswerColour = Color(.red)
        }
        
    }
}

struct QuestionView: View {
    
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

struct Page5_Previews: PreviewProvider {
    static var previews: some View {
        Page5()
    }
}
