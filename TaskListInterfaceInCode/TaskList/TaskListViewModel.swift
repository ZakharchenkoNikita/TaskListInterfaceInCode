//
//  TaskListViewModel.swift
//  TaskListInterfaceInCode
//
//  Created by Nikita on 23.10.21.
//

import Foundation

protocol TaskListViewModelProtocol {
    var taskList: [Task] { get set }
    
    func fetchTasks(completion: @escaping() -> Void)
    func getNumberOfRows() -> Int
}

class TaskListViewModel: TaskListViewModelProtocol {
    var taskList: [Task] = []
    
    func fetchTasks(completion: @escaping () -> Void) {
        taskList = DataManager.shared.fetchData()
        completion()
    }
    
    func getNumberOfRows() -> Int {
        taskList.count
    }
}
