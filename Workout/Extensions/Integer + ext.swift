//
//  Integer + ext.swift
//  Workout
//
//  Created by Айдар Оспанов on 06.03.2023.
//

import Foundation


extension Int {
    
    func getTimerFromSeconds() -> String {
        
        if self / 60 == 0 {
            return "\(self % 60)sec"
        }
        
        if self % 60 == 0 {
            return "\(self / 60)min"
        }
        
        return "\(self / 60)min \(self % 60)sec"
    }
}
