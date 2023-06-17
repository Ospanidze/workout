//
//  UIButton + ext.swift
//  Workout
//
//  Created by Айдар Оспанов on 06.03.2023.
//

import UIKit

extension UIButton {
    
    convenience init(name: String) {
        self.init(frame: .zero)
//        self.init(type: .system)
        self.setTitle(name, for: .normal)
        self.backgroundColor = .specialGreen
        self.titleLabel?.font = .robotoBold16()
        self.tintColor = .white
        self.layer.cornerRadius = 10
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
