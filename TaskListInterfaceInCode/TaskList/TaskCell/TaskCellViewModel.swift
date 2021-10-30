//
//  TaskCellViewModel.swift
//  TaskListInterfaceInCode
//
//  Created by Nikita on 23.10.21.
//

import Foundation

protocol TaskCellViewModelProtocol {
    var name: String { get }
    var isDone: Bool { get }
    
    var viewModelDidChange: ((TaskCellViewModelProtocol) -> Void)? { get set }
    
    init(task: Task)
    
    func isDoneButtonPressed()
}

class TaskCellViewModel: TaskCellViewModelProtocol {
    
    var name: String {
        task.name ?? ""
    }
    
    var isDone: Bool {
        get {
            task.isDone
        } set {
            DataManager.shared.complete(task: task, status: newValue)
            viewModelDidChange?(self)
        }
    }
    
    var viewModelDidChange: ((TaskCellViewModelProtocol) -> Void)?
    
    private let task: Task
    
    required init(task: Task) {
        self.task = task
    }
    
    func isDoneButtonPressed() {
        isDone.toggle()
    }
}
