//
//  CustomButton.swift
//  TaskListInterfaceInCode
//
//  Created by Nikita on 23.10.21.
//

import UIKit

class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(title: String, buttonColor: UIColor) {
        super.init(frame: .zero)
        
        backgroundColor = buttonColor
        setTitle(title, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = 5
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
