//
//  TaskListViewController.swift
//  TaskListInterfaceInCode
//
//  Created by Nikita on 23.10.21.
//

import UIKit

protocol TaskViewControllerDelegate {
    func reloadTable(task: Task)
}

class TaskListViewController: UITableViewController, TaskViewControllerDelegate {
    
    //MARK: Private propetries
    private let cellID = "cell"
    
    var viewModel: TaskListViewModelProtocol! {
        didSet {
            viewModel.fetchTasks {
                self.tableView.reloadData()
            }
        }
    }
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupNavigationBar()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TaskTableViewCell.self, forCellReuseIdentifier: cellID)
    }
    
    //MARK: Methods
    func reloadTable(task: Task) {
        viewModel.append(task: task)
        let cellIndex = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [cellIndex], with: .automatic)
    }
}

//MARK: Private Metrhods
extension TaskListViewController {
    private func setupNavigationBar() {
        title = viewModel.taskCategory.name

        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addNewTask)
        )
    }
    
    @objc private func addNewTask() {
        let newTaskVC = NewTaskViewController()
        newTaskVC.delegate = self
        newTaskVC.viewModel = viewModel.showNewTaskViewModel()
        present(newTaskVC, animated: true)
    }
}

//MARK: TableViewDataSource
extension TaskListViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        section == 0 ? "Uncompleted" : "Completed"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        section == 0 ? viewModel.getNumberOfRowsForUncompleted() : viewModel.getNumberOfRowsForCompleted()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! TaskTableViewCell
        cell.viewModel = viewModel.getCellViewModel(at: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            viewModel.delete(at: indexPath)
            let cellIndex = IndexPath(row: indexPath.row, section: 0)
            tableView.deleteRows(at: [cellIndex], with: .automatic)
        }
    }
}

//MARK: TableViewDelegate
extension TaskListViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.complete(at: indexPath)
        tableView.reloadData()
    }
}
