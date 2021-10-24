//
//  TasksViewController.swift
//  TaskListInterfaceInCode
//
//  Created by Nikita on 24.10.21.
//

import UIKit

class TasksViewController: UIViewController {

    var task: [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        task = DataManager.shared.fetchTaskList()
        print(task.count)
    }
}
