//
//  UIView + ext.swift
//  Workout
//
//  Created by Айдар Оспанов on 25.02.2023.
//

import UIKit

extension UIView {
    
    func setupShadowOnView() {
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowRadius = 7
        layer.shadowOpacity = 0.7
        layer.shadowOffset = CGSize(width: 0, height: 10)
    }
}
