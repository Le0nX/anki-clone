//
//  SelectQuestionGroupViewController.swift
//  anki-clone
//
//  Created by Denis Nefedov on 08.10.2019.
//  Copyright © 2019 X. All rights reserved.
//

import UIKit

class SelectQuestionGroupViewController: UIViewController {
    //MARK: - IBOutlets
    
    @IBOutlet internal var tableView: UITableView! {
        didSet {
            tableView.tableFooterView = UIView() // убираем неиспользуемые cells.
        }
    }
    
    //MARK: - Properties
    public let questionGroups = QuestionGroup.allGroups()
    private var selectedQuestionGroup: QuestionGroup!
    
    //MARK: - Controller logic
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

extension SelectQuestionGroupViewController: UITableViewDelegate, UITableViewDataSource {
    //MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return questionGroups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
        withIdentifier: "QuestionGroupCell") as! QuestionGroupCell
        let questionGroup = questionGroups[indexPath.row]
        cell.titleLabel.text = questionGroup.title
        return cell
    }
    
    //MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        // выбираем группу в willSelectRowAt
        // потому что переход осуществляется полсе этого вызова и до
        // didSelectRowAt. Если мы попытаемся назначить группу в didSelectRowAt, то
        // на момент prepare мы получим ошибку из-за nil в selectedQuestionGroup
        selectedQuestionGroup = questionGroups[indexPath.row]
        return indexPath
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK: - Segue prepare
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // подготавливаемся к переходу
        guard let vc = segue.destination as? QuestionViewController else {return}
        vc.questionStrategy = RandomQuestionStrategy(questionGroup: selectedQuestionGroup)
        vc.delegate = self // передаем себя в качестве делегата questionVC'ру
    }
    
    
}


extension SelectQuestionGroupViewController: QuestionViewControllerDelegate {
    func questionViewController(_ viewController: QuestionViewController, didCancel questionGroup: QuestionStrategy) {
        
        navigationController?.popViewController(animated: true)
    }
    
    func questionViewController(_ viewController: QuestionViewController, didComplete questionGroup: QuestionStrategy) {
        
        navigationController?.popViewController(animated: true)
    }
    
    
}
