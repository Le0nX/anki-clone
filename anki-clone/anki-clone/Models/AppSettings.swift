//
//  AppSettings.swift
//  anki-clone
//
//  Created by Denis Nefedov on 10.10.2019.
//  Copyright © 2019 X. All rights reserved.
//

import Foundation

// App settings singleton
// MARK: - App settings
public class AppSettings {
    public static let shared = AppSettings()
    
    private init(){}
}

// MARK: - Question Strategy enum
public enum QuestionStrategyType: Int, CaseIterable {
    
    case sequential
    case random
    
    public func title() -> String {
        switch self {
        case .random:
            return "Random"
        case .sequential:
            return "Sequential"
        }
    }
    
    public func questionStrategy(for questionGroup: QuestionGroup) -> QuestionStrategy {
        switch self {
        case .random:
          return RandomQuestionStrategy(
            questionGroup: questionGroup)
        case .sequential:
            return SequentialQuestionStrategy(questionGroup: questionGroup)
        }
    }

}
