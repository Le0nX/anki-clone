//
//  QuestionView.swift
//  anki-clone
//
//  Created by Denis Nefedov on 06.10.2019.
//  Copyright © 2019 X. All rights reserved.
//

import UIKit

public class QuestionView: UIView {
    @IBOutlet public var answerLabel: UILabel!
    @IBOutlet public var correctCountLabel: UILabel!
    @IBOutlet public var incorrectCountLabel: UILabel!
    @IBOutlet public var promptLabel: UILabel!
    @IBOutlet public var hintLabel: UILabel!
}
