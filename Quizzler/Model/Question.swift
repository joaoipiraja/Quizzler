//
//  Question.swift
//  Quizzler
//
//  Created by João Victor Ipirajá de Alencar on 23/12/20.
//

import Foundation



struct Question: Codable {
    
    var question_id: Int
    var question_string: String
    var answer: Bool
    var points: Int
}
