//
//  CloseButton.swift
//  Workout
//
//  Created by Айдар Оспанов on 06.03.2023.
//

import UIKit

//protocol NewWorkVCdelegate: AnyObject {
//    func presentVC(_ vc: UIViewController)
//}

class CloseButton: UIButton {
   
//    var newWorkVCDelegate: NewWorkVCdelegate!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCloseButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCloseButton() {
        translatesAutoresizingMaskIntoConstraints = false
        setImage(UIImage(named: "closeButton"), for: .normal)
    }
    
   
}


