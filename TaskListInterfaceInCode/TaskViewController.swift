//
//  TaskViewController.swift
//  TaskListInterfaceInCode
//
//  Created by Nikita on 23.10.21.
//

import UIKit

class TaskViewController: UIViewController {
    
    private lazy var taskTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Add new task"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private lazy var saveButton: CustomButton = {
        let button = CustomButton(title: "Save", buttonColor: .blue)
        return button
    }()
    
    private lazy var cancelButton: CustomButton = {
        let button = CustomButton(title: "Cancel", buttonColor: .red)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup(subViews: taskTextField, saveButton, cancelButton)
        setupConstraints()
    }
    
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
    }
}
