//
//  SequentialQuestionStrategy.swift
//  anki-clone
//
//  Created by Denis Nefedov on 10.10.2019.
//  Copyright © 2019 X. All rights reserved.
//

import Foundation

public class SequentialQuestionStrategy: QuestionStrategy {
    
    // MARK: - properties
    public var correctCount: Int = 0
    public var incorrectCount: Int = 0
    
    private let questionGroup: QuestionGroup
    private var questionIndex = 0
    
    public var title: String {
        return questionGroup.title
    }
    
    public init(questionGroup: QuestionGroup) {
        self.questionGroup = questionGroup
    }
    
    //MARK: - Strategy
    public func advanceToNextQuestion() -> Bool {
        guard questionIndex + 1 < questionGroup.questions.count else {
            return false
        }
        
        questionIndex += 1
        return true
    }
    
    public func currentQuestion() -> Question {
        return questionGroup.questions[questionIndex]
    }
    
    public func markQuestionCorrect(_ question: Question) {
        correctCount += 1
    }
    
    public func markQuestionIncorrect(_ question: Question) {
        incorrectCount += 1
    }
    
    public func questionIndexTitle() -> String {
        return "\(questionIndex)/\(questionGroup.questions.count)"
    }
    
    
}
