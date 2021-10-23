//
//  TaskCellViewModel.swift
//  TaskListInterfaceInCode
//
//  Created by Nikita on 23.10.21.
//

import Foundation

protocol TaskCellViewModelProtocol {
    var name: String { get }
    
    init(task: TaskCategory)
}

class TaskCellViewModel: TaskCellViewModelProtocol {
    var name: String {
        task.name ?? ""
    }
    
    private let task: TaskCategory
    
    required init(task: TaskCategory) {
        self.task = task
    }
}
