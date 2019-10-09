//
//  ViewController.swift
//  anki-clone
//
//  Created by Denis Nefedov on 06.10.2019.
//  Copyright © 2019 X. All rights reserved.
//

import UIKit

public protocol QuestionViewControllerDelegate: class {
    func questionViewController(_ viewController: QuestionViewController,
                                  didCancel questionGroup: QuestionGroup,
                                  at questionIndex: Int)
    
    func questionViewController(_ viewController: QuestionViewController,
                                  didComplete questionGroup: QuestionGroup,
                                  at questionIndex: Int)
}

public class QuestionViewController: UIViewController {

    //MARK: - Properties
    public var questionGroup: QuestionGroup! {
        didSet {
            navigationItem.title = questionGroup.title
        }
    }
    
    private lazy var questionIndexItem: UIBarButtonItem = {
        let item = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        item.tintColor = .black
        navigationItem.rightBarButtonItem = item
        return item
    }()
    
    public var questionIndex = 0
    
    public var correctAnswers = 0
    public var incorrectAnswers = 0
    
    public var questionView: QuestionView? {
        guard isViewLoaded else {return nil} // проверяем, что вью прогрузилась
        return (view as! QuestionView)
    }
    
    //MARK: - Delegate
    // слабая ссылка для избежания retain cicle
    public weak var delegate: QuestionViewControllerDelegate?
    
    //MARK: - Controller logic
    override public func viewDidLoad() {
        super.viewDidLoad()
        setupCancelButton()
        showQuestion()
    }
    
    private func showQuestion() {
        let question = questionGroup.questions[questionIndex]
        
        questionView?.answerLabel.text = question.answer
        questionView?.promptLabel.text = question.prompt
        questionView?.hintLabel.text = question.hint
        
        questionView?.answerLabel.isHidden = true
        questionView?.hintLabel.isHidden = true
        
        questionIndexItem.title = "\(questionIndex + 1)/" + "\(questionGroup.questions.count)"
    }

    private func showNextQuestion() {
        questionIndex += 1
        guard questionIndex < questionGroup.questions.count else {
            // TODO: - Handle this...!
            return
        }
        showQuestion()
    }
    
    //MARK: - Cancel Button Routines
    private func setupCancelButton() {
        let action = #selector(handleCancelPressed(sender:))
        let image = UIImage(named: "ic_menu")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: action)
    }
    
    @objc private func handleCancelPressed(sender: UIBarButtonItem) {
        delegate?.questionViewController(self, didCancel: questionGroup, at: questionIndex)
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

