//
//  TaskTableViewCell.swift
//  TaskListInterfaceInCode
//
//  Created by Nikita on 23.10.21.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    
    private let cellID = "cell"
    
    private lazy var isDoneButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(pressedIsDoneButton), for: .touchDown)
        return button
    }()
    
    private lazy var taskNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .gray
        return label
    }()
    
    var viewModel: TaskCellViewModelProtocol! {
        didSet {
            taskNameLabel.text = viewModel.name
            viewModel.viewModelDidChange = { viewModel in
                self.setImageForIsDoneButton(viewModel.isDone)
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: cellID)
        contentView.addSubview(isDoneButton)
        contentView.addSubview(taskNameLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupConstraints()
        setImageForIsDoneButton(viewModel.isDone)
    }
    
    @objc private func pressedIsDoneButton() {
        viewModel.isDoneButtonPressed()
    }
    
    private func setImageForIsDoneButton(_ status: Bool) {
        isDoneButton.setImage(
            status ? UIImage(systemName: "checkmark.circle.fill") : UIImage(systemName: "checkmark.circle"),
            for: .normal
        )
    }
    
    private func setupConstraints() {
        isDoneButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            isDoneButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            isDoneButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            isDoneButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20)
        ])
        
        taskNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            taskNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            taskNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            taskNameLabel.leadingAnchor.constraint(equalTo: isDoneButton.trailingAnchor, constant: 10)
        ])
        
    }
}
