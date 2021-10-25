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
    func getNumberOfRowsForCompleted() -> Int
    func getNumberOfRowsForUncompleted() -> Int
    func delete(at indexPath: IndexPath)
    func append(task: Task)
    func complete(at indexPath: IndexPath)
    
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
        completion()
    }
    
    func getNumberOfRowsForCompleted() -> Int {
        let list = taskList.filter( { $0.isDone == true } )
        return list.count
    }
    
    func getNumberOfRowsForUncompleted() -> Int {
        let list = taskList.filter( { $0.isDone == false } )
        return list.count
    }
    
    func delete(at indexPath: IndexPath) {
        let task = taskList[indexPath.row]
        DataManager.shared.deleteTask(task: task)
        taskList.remove(at: indexPath.row)
    }
    
    func append(task: Task) {
        taskList.insert(task, at: 0)
    }
    
    func complete(at indexPath: IndexPath) {
        let task = taskList[indexPath.row]
        DataManager.shared.completeTask(task: task)
    }

    func getCellViewModel(at indexPath: IndexPath) -> TaskCellViewModelProtocol {
        let task = taskList[indexPath.row]
        return TaskCellViewModel(task: task)
    }
    
    func showNewTaskViewModel() -> NewTaskViewModelProtocol? {
        NewTaskViewModel(taskCategory: taskCategory)
    }
}
