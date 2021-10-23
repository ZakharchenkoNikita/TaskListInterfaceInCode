//
//  TaskCellViewModel.swift
//  TaskListInterfaceInCode
//
//  Created by Nikita on 23.10.21.
//

import Foundation

protocol TaskCellViewModelProtocol {
    var name: String { get }
    
    init(task: Task)
}

class TaskCellViewModel: TaskCellViewModelProtocol {
    var name: String {
        task.name ?? ""
    }
    
    private let task: Task
    
    required init(task: Task) {
        self.task = task
    }
}
