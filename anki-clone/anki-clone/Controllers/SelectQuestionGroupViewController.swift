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
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
