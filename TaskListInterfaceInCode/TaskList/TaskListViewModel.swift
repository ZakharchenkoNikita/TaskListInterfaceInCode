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
    
    func delete(at indexPath: IndexPath)
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
        let taskList = taskCategory.task?.allObjects as! [Task]
        sortTaskList(taskList)
        completion()
    }
    
    func getNumberOfRows() -> Int {
        taskList.count
    }
    
    func delete(at indexPath: IndexPath) {
        let task = taskList[indexPath.row]
        DataManager.shared.deleteTask(task: task)
        taskList.remove(at: indexPath.row)
    }
    
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
    
    private func sortTaskList(_ taskList: [Task]) {
        self.taskList = taskList.sorted(by: {
            $0.date?.compare($1.date ?? Date()) == .orderedDescending
        })
    }
}
