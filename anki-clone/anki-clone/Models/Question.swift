//
//  Question.swift
//  anki-clone
//
//  Created by Denis Nefedov on 06.10.2019.
//  Copyright © 2019 X. All rights reserved.
//

import Foundation

// MARK: - Question model
public struct Question {
    public let answer: String
    public let hint: String?
    public let prompt: String
}
