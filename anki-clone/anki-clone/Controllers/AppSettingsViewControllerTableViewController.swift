//
//  AppSettingsViewControllerTableViewController.swift
//  anki-clone
//
//  Created by user160865 on 11/15/19.
//  Copyright © 2019 X. All rights reserved.
//

import UIKit

class AppSettingsViewControllerTableViewController: UITableViewController {
    
    public let  appSettings = AppSettings.shared
    private let settingsCellId = "settingsCellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: settingsCellId)
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // returning number of cases in our settings enum
        return QuestionStrategyType.allCases.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: settingsCellId, for: indexPath)

        let questionStrategyType = QuestionStrategyType(rawValue: indexPath.row)
        
        cell.textLabel?.text = questionStrategyType?.title()
        
        if appSettings.questionStrategyType == questionStrategyType {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }

}

extension AppSettingsViewControllerTableViewController {
    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let questionStrategyType = QuestionStrategyType(rawValue: indexPath.row)
        
        appSettings.questionStrategyType = questionStrategyType!
        tableView.reloadData()
    }
}
