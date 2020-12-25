//
//  QuestionBrain.swift
//  Quizzler
//
//  Created by João Victor Ipirajá de Alencar on 24/12/20.
//

import Foundation

public class QuestionBrain {
    private var data: Array<Question> = QuestionLoader().questions
    private var questionNumber:Int = 1
    private var score:Int = 0
    
    
    func isPlaying() -> Bool{
        return ((self.questionNumber) != (self.data.count+1))
    }
    
    private func nextQuestion(){
        self.questionNumber+=1
    }
    
    private func getindex() -> Int{
        if let i = data.firstIndex(where: { $0.question_id  == self.questionNumber}) {
            return i
        }else{
            return (data.count - 1)
        }
        
    }
    
    func checkAnswer(_ userAnswer: String){
        
            let userAnswer = Bool(userAnswer.lowercased())
            let answer = self.data[getindex()].answer
            if(userAnswer == answer){
                self.score += self.data[getindex()].points
            }
            self.nextQuestion()
        
    }
    
    func getQuestionText() -> String{
        return data[getindex()].question_string
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
    
    
  
    
    
}
    
