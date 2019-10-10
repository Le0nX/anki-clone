//
//  RandomQuestionStrategy.swift
//  anki-clone
//
//  Created by Denis Nefedov on 10.10.2019.
//  Copyright © 2019 X. All rights reserved.
//

import Foundation
import GameplayKit //GKRandomSource

public class RandomQuestionStrategy: QuestionStrategy {
    
    public var correctCount: Int = 0
    public var incorrectCount: Int = 0
    
    private let questionGroup: QuestionGroup
    private var questionIndex = 0
    private let questions: [Question] // randomized questions storage
    
    public var title: String {
        return questionGroup.title
    }
    
    // randomized constructor
    public init(questionGroup: QuestionGroup) {
        self.questionGroup = questionGroup
        
        let randomSource = GKRandomSource.sharedRandom()
        self.questions = randomSource.arrayByShufflingObjects(in: questionGroup.questions) as! [Question]
    }
    
    public func advanceToNextQuestion() -> Bool {
        guard questionIndex < questions.count else {
            return false
        }
        
        questionIndex += 1
        return true
    }
    
    public func currentQuestion() -> Question {
        return questions[questionIndex]
    }
    
    public func markQuestionCorrect(_ question: Question) {
        correctCount += 1
    }
    
    public func markQuestionIncorrect(_ question: Question) {
        incorrectCount += 1
    }
    
    public func questionIndexTitle() -> String {
        return "\(questionIndex + 1)/\(questions.count)"
    }
    
    
    
}
