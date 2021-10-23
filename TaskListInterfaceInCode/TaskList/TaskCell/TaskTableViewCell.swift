//
//  TaskTableViewCell.swift
//  TaskListInterfaceInCode
//
//  Created by Nikita on 23.10.21.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    var viewModel: TaskCellViewModelProtocol! {
        didSet {
            var content = defaultContentConfiguration()
            content.text = viewModel.name
            contentConfiguration = content
        }
    }

}
