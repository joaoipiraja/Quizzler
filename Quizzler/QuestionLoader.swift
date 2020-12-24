//
//  QuestionLoader.swift
//  Quizzler
//
//  Created by João Victor Ipirajá de Alencar on 23/12/20.
//

import Foundation

public class QuestionLoader {
    
    @Published var questions = [Question]()
    
    init() {
        load()
    }
    
    func load() {
        
        if let fileLocation = Bundle.main.url(forResource: "mydata", withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([Question].self, from: data)
                
                self.questions = dataFromJson
            } catch {
                print(error)
            }
        }
    }
    
}
