//
//  TaskCategoryViewModel.swift
//  TaskListInterfaceInCode
//
//  Created by Nikita on 23.10.21.
//

import Foundation

protocol TaskCategoryViewModelProtocol {
    var taskCategories: [TaskCategory] { get set }
    
    func fetchTaskCategories(completion: @escaping() -> Void)
    func getNumberOfRows() -> Int
    
    func getCellViewModel(at indexPath: IndexPath) -> TaskCategoryCellViewModelProtocol
    func viewModelForSelectedRow() -> TaskListViewModelProtocol?
    func selectRow(atIndexPath indexPath: IndexPath)
}

class TaskCategoryViewModel: TaskCategoryViewModelProtocol {
    
    var taskCategories: [TaskCategory] = []
    
    private var selectedIndexPath: IndexPath?
    
    func fetchTaskCategories(completion: () -> Void) {
        taskCategories = DataManager.shared.fetchTaskCategories()
    }
    
    func getNumberOfRows() -> Int {
        taskCategories.count
    }
    
    func getCellViewModel(at indexPath: IndexPath) -> TaskCategoryCellViewModelProtocol {
        let taskCategory = taskCategories[indexPath.row]
        return TaskCategoryCellViewModel(taskCategory: taskCategory)
    }
    
    func viewModelForSelectedRow() -> TaskListViewModelProtocol? {
        guard let selectedIndexPath = selectedIndexPath else { return nil }
        return TaskListViewModel(taskCategory: taskCategories[selectedIndexPath.row])
    }
    
    func selectRow(atIndexPath indexPath: IndexPath) {
        selectedIndexPath = indexPath
    }
}
