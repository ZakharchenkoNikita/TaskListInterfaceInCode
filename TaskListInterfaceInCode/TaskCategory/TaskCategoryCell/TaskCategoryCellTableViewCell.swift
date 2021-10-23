//
//  TaskCategoryTableViewCell.swift
//  TaskListInterfaceInCode
//
//  Created by Nikita on 23.10.21.
//

import UIKit

class TaskCategoryCellTableViewCell: UITableViewCell {
    var viewModel: TaskCategoryCellViewModelProtocol! {
        didSet {
            var content = defaultContentConfiguration()
            content.text = viewModel.name
            contentConfiguration = content
        }
    }
}
