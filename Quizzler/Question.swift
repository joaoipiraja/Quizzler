//
//  Question.swift
//  Quizzler
//
//  Created by João Victor Ipirajá de Alencar on 23/12/20.
//

import Foundation

import Foundation

struct Question: Codable {
    
    var question_id: Int
    var question_string: String
    var isTrue: Bool
    var points: Int
}
