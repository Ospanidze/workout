//
//  UILabel + ext.swift
//  Workout
//
//  Created by Айдар Оспанов on 21.02.2023.
//

import UIKit

extension UILabel {
    
    convenience init(text: String, font: UIFont?, textAlignment: NSTextAlignment = .left, textColor: UIColor = .specialBrown, opacity: Float? = nil ){
        self.init()
        
        self.text = text
        self.font = font
        self.textAlignment = textAlignment
        self.textColor = textColor
        self.adjustsFontSizeToFitWidth = true
        self.minimumScaleFactor = 0.7
        self.numberOfLines = 4
        self.layer.opacity = opacity ?? 1
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
