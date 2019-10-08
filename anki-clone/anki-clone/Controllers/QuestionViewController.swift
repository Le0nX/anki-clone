//
//  ViewController.swift
//  anki-clone
//
//  Created by Denis Nefedov on 06.10.2019.
//  Copyright © 2019 X. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    //MARK: - Properties
    public var questionGroup = QuestionGroup.basicPhrases()
    public var questionIndex = 0
    
    public var correctAnswers = 0
    public var incorrectAnswers = 0
    
    public var questionView: QuestionView? {
        guard isViewLoaded else {return nil} // проверяем, что вью прогрузилась
        return (view as! QuestionView)
    }
    
    //MARK: - Controller logic
    override func viewDidLoad() {
        super.viewDidLoad()
        showQuestion()
    }
    
    private func showQuestion() {
        let question = questionGroup.questions[questionIndex]
        
        questionView?.answerLabel.text = question.answer
        questionView?.promptLabel.text = question.prompt
        questionView?.hintLabel.text = question.hint
        
        questionView?.answerLabel.isHidden = true
        questionView?.hintLabel.isHidden = true
    }

    private func showNextQuestion() {
        questionIndex += 1
        guard questionIndex < questionGroup.questions.count else {
            // TODO: - Handle this...!
            return
        }
        showQuestion()
    }
    
    // MARK: - IBActions
    @IBAction func toggleAnswerLabels(_ sender: Any) {
        questionView?.answerLabel.isHidden = !(questionView?.answerLabel.isHidden)!
        questionView?.hintLabel.isHidden = !(questionView?.hintLabel.isHidden)!
    }
    
    @IBAction func handleCorrect(_ sender: Any) { correctAnswers += 1
        questionView!.correctCountLabel.text = "\(correctAnswers)"
        showNextQuestion()
    }

    @IBAction func handleIncorrect(_ sender: Any) { incorrectAnswers += 1
        questionView!.incorrectCountLabel.text = "\(incorrectAnswers)"
        showNextQuestion()
    }
}

