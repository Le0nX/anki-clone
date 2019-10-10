//
//  QuestionStrategy.swift
//  anki-clone
//
//  Created by Denis Nefedov on 09.10.2019.
//  Copyright © 2019 X. All rights reserved.
//

import Foundation

public protocol QuestionStrategy : class {
    
    var title: String {get} // current set of questions
    
    var correctCount: Int {get}
    var incorrectCount: Int {get}
    
    func advanceToNextQuestion() -> Bool // if there is no question return false
    
    func currentQuestion() -> Question
    
    func markQuestionCorrect(_ question: Question)
    func markQuestionIncorrect(_ question: Question)
    
    func questionIndexTitle() -> String // total progress 1/10 etc...
    
}

