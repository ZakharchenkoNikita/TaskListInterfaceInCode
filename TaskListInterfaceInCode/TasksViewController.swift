//
//  TasksViewController.swift
//  TaskListInterfaceInCode
//
//  Created by Nikita on 24.10.21.
//

import UIKit

class TasksViewController: UIViewController {

    var task: [TaskCategory] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        task = DataManager.shared.fetchTaskCategories()
        print(task.count)
    }
}
