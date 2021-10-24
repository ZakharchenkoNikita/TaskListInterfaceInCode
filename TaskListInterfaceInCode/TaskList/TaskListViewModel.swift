//
//  TaskListViewModel.swift
//  TaskListInterfaceInCode
//
//  Created by Nikita on 23.10.21.
//

import Foundation

protocol TaskListViewModelProtocol {
    var taskCategory: TaskCategory { get }
    var taskList: [Task] { get set }
    
    init(taskCategory: TaskCategory)
    
    func fetchTasks(completion: @escaping() -> Void)
    func getNumberOfRows() -> Int
//    func delete(at indexPath: IndexPath)
    func append(task: Task)
    
    func getCellViewModel(at indexPath: IndexPath) -> TaskCellViewModelProtocol
    func showNewTaskViewModel() -> NewTaskViewModelProtocol?
}

class TaskListViewModel: TaskListViewModelProtocol {
    
    var taskCategory: TaskCategory
    var taskList: [Task] = []
    
    required init(taskCategory: TaskCategory) {
        self.taskCategory = taskCategory
    }
    
    func fetchTasks(completion: @escaping () -> Void) {
        taskList = taskCategory.task?.allObjects as! [Task]
//        taskList = DataManager.shared.fetchTaskList()
        completion()
    }
    
    func getNumberOfRows() -> Int {
        taskList.count
    }
    
//    func delete(at indexPath: IndexPath) {
//        DataManager.shared.deleteTaskCategory(index: indexPath.row, taskCategories: taskList)
//        taskList.remove(at: indexPath.row)
//    }
//    
    func append(task: Task) {
        taskList.insert(task, at: 0)
    }

    func getCellViewModel(at indexPath: IndexPath) -> TaskCellViewModelProtocol {
        let task = taskList[indexPath.row]
        return TaskCellViewModel(task: task)
    }
    
    func showNewTaskViewModel() -> NewTaskViewModelProtocol? {
        NewTaskViewModel(taskCategory: taskCategory)
    }
}
