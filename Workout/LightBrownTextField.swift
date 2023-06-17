//
//  LightBrownTextField.swift
//  Workout
//
//  Created by Айдар Оспанов on 06.03.2023.
//

import UIKit

class LightBrownTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .specialLightBrown
        font = UIFont.robotoBold20()
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        leftViewMode = .always
        clearButtonMode = .always
        layer.cornerRadius = 10
        returnKeyType = .done
    }
}

extension LightBrownTextField: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    

}
