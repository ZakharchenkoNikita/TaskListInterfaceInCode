//
//  NewTaskViewController.swift
//  TaskListInterfaceInCode
//
//  Created by Nikita on 23.10.21.
//

import UIKit

class NewTaskViewController: UIViewController {
    
    //MARK: Private propetries
    private lazy var taskTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Add new task"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private lazy var saveButton: CustomButton = {
        let buttonColor = UIColor(
            red: 21/255,
            green: 101/255,
            blue: 192/255,
            alpha: 194/255
        )
        
        let button = CustomButton(title: "Save", buttonColor: buttonColor)
        button.addTarget(self, action: #selector(save), for: .touchUpInside)
        return button
    }()
    
    private lazy var cancelButton: CustomButton = {
        let button = CustomButton(title: "Cancel", buttonColor: .orange)
        button.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        return button
    }()
    
    var delegate: TaskViewControllerDelegate!
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = .white
        setup(subViews: taskTextField, saveButton, cancelButton)
        setupConstraints()
    }
}

//MARK: Private Metrhods
extension NewTaskViewController {
    private func setup(subViews: UIView...) {
        subViews.forEach { subView in
            view.addSubview(subView)
        }
    }
    
    private func setupConstraints() {
        taskTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            taskTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            taskTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            taskTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
        ])
        
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: taskTextField.bottomAnchor, constant: 40),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100)
        ])
        
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cancelButton.topAnchor.constraint(equalTo: saveButton.bottomAnchor, constant: 20),
            cancelButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            cancelButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100)
        ])
    }
    
    @objc private func save() {
        guard let name = taskTextField.text, !name.isEmpty else { return }
        DataManager.shared.save(name) { task in
            delegate.reloadTable(task: task)
        }
        dismiss(animated: true)
    }
    
    @objc private func cancel() {
        dismiss(animated: true)
    }
}
