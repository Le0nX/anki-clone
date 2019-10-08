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
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        selectedQuestionGroup = questionGroups[indexPath.row]
        return indexPath
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // подготавливаемся к переходу
        guard let vc = segue.destination as? QuestionViewController else {return}
        vc.questionGroup = selectedQuestionGroup
    }
    
    
}
