//
//  QuestionBrain.swift
//  Quizzler
//
//  Created by João Victor Ipirajá de Alencar on 24/12/20.
//

import Foundation

public class QuestionBrain {
    private var data: Array<Question> = QuestionLoader().questions
    private var questionNumber:Int = 0
    private var score:Int = 0
    
    
   
    func nextQuestion(){
        if((self.questionNumber+1) < self.data.count){
            self.questionNumber+=1
        }
    }
    
    func checkAnswer(_ userAnswer: String){
        let userAnswer = Bool(userAnswer.lowercased())
        let answer = self.data[self.questionNumber].answer
        if(userAnswer == answer){
            self.score += self.data[self.questionNumber].points
        }
        
    }
    func getQuestionText() -> String{
        return self.data[self.questionNumber].question_string
    }
    func getProgress() -> Float{
        let progress = Float(self.questionNumber)/(Float(self.data.count) - 1.0)
        return progress
    }
    
    func getPercentageScore() -> String{
        let totalPoints = self.data.map({$0.points}).reduce(0, +)
        let percent = 100.0*(Float(score)/Float(totalPoints))
        return String(format: "%.1f",percent) + "%"
    }
    
    func getScore() -> String{
        return String(format: "%d points",self.score)
    }
    
    func isPlaying() -> Bool{
        return ((self.questionNumber+1) < self.data.count)
    }
    
  
    
    
}
    
