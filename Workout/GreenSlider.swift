//
//  GreenSlider.swift
//  Workout
//
//  Created by Айдар Оспанов on 06.03.2023.
//

import UIKit

class GreenSlider: UISlider {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        maximumTrackTintColor = .specialBrown
        minimumTrackTintColor = .specialGreen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
