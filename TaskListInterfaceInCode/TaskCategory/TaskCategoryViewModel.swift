//
//  TaskCategoryViewModel.swift
//  TaskListInterfaceInCode
//
//  Created by Nikita on 23.10.21.
//

import Foundation

protocol TaskCategoryViewModelProtocol {
    var taskCategories: [TaskCategory] { get }
    
    func fetchTaskCategories(completion: @escaping() -> Void)
    func getNumberOfRows() -> Int
    
    func getCellViewModel(at indexPath: IndexPath) -> TaskCategoryCellViewModelProtocol
}

class TaskCategoryViewModel: TaskCategoryViewModelProtocol {
    var taskCategories: [TaskCategory] = []
    
    func fetchTaskCategories(completion: () -> Void) {
        taskCategories = DataManager.shared.fetchData()
    }
    
    func getNumberOfRows() -> Int {
        taskCategories.count
    }
    
    func getCellViewModel(at indexPath: IndexPath) -> TaskCategoryCellViewModelProtocol {
        let taskCategory = taskCategories[indexPath.row]
        return TaskCategoryCellViewModel(taskCategory: taskCategory)
    }
}
