//
//  NewTaskViewModel.swift
//  TaskListInterfaceInCode
//
//  Created by Nikita on 24.10.21.
//

import Foundation

protocol NewTaskViewModelProtocol {
    var taskCategory: TaskCategory { get }
    
    init(taskCategory: TaskCategory)
}

class NewTaskViewModel: NewTaskViewModelProtocol {
    var taskCategory: TaskCategory
    
    required init(taskCategory: TaskCategory) {
        self.taskCategory = taskCategory
    }
}
