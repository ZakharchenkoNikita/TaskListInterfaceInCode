//
//  TaskTableViewCell.swift
//  TaskListInterfaceInCode
//
//  Created by Nikita on 23.10.21.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    func configure(with task: Task) {
        var content = defaultContentConfiguration()
        content.text = task.name
        contentConfiguration = content
    }
}
