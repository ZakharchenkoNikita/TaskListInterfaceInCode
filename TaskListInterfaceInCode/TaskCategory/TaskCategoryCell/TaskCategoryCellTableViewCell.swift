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
            content.image = UIImage(systemName: "list.dash")
            content.text = viewModel.name
            content.secondaryText = viewModel.tasks
            contentConfiguration = content
        }
    }
    
    private let cellID = "categoryCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: cellID)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
