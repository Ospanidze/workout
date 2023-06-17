//
//  UIViewController + ext.swift
//  Workout
//
//  Created by Айдар Оспанов on 10.03.2023.
//

import UIKit

extension UIViewController {
    func presentSimpleAlert(title: String, message: String?) {
        
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "ok", style: .default)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
}
