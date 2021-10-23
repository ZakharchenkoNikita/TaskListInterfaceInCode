//
//  TaskCategoryCellViewModel.swift
//  TaskListInterfaceInCode
//
//  Created by Nikita on 23.10.21.
//

import Foundation

protocol TaskCategoryCellViewModelProtocol {
    var name: String { get }
    
    init(taskCategory: TaskCategory)
}

class TaskCategoryCellViewModel: TaskCategoryCellViewModelProtocol {
    var name: String {
        taskCategory.name ?? ""
    }
    
    private let taskCategory: TaskCategory
    
    required init(taskCategory: TaskCategory) {
        self.taskCategory = taskCategory
    }
}
