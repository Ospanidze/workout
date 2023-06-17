//
//  NameView.swift
//  Workout
//
//  Created by Айдар Оспанов on 01.03.2023.
//

import UIKit

class NameView: UIView {
    
    private let padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    
    private let nameLabel = UILabel(text: "Name", font: UIFont.robotoMedium14())
    
    private let nameTextField = LightBrownTextField()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        setupViews()
        setupLayout()
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getNameTextField() -> String {
        guard let text = nameTextField.text else { return "" }
        return text
    }
    
    func deleteTextTextField() {
        nameTextField.text = ""
    }
    
    private func setupViews() {
        addSubview(nameLabel)
        addSubview(nameTextField)
    }
}

private extension NameView {
    private func setupLayout() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            nameLabel.heightAnchor.constraint(equalToConstant: 16),
            
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameTextField.trailingAnchor.constraint(equalTo: trailingAnchor),
            nameTextField.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
