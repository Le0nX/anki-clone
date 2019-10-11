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
    
    // MARK: - UserDefaults Keys
    private struct Keys {
      static let questionStrategy = "questionStrategy"
    }
    
    //MARK: - UserDefaults save/load
    private let userDefaults = UserDefaults.standard
    public var questionStrategyType: QuestionStrategyType {
        get {
            let rawValue =  userDefaults.integer(forKey: Keys.questionStrategy)
            return QuestionStrategyType(rawValue: rawValue)!
        }
        set {
            userDefaults.set(newValue.rawValue, forKey: Keys.questionStrategy)
        }
    }
    
    
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
