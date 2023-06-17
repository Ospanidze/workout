//
//  WorkoutCollectionCell.swift
//  Workout
//
//  Created by Айдар Оспанов on 16.03.2023.
//

import UIKit

class WorkoutCollectionCell: UICollectionViewCell {
    
    private let backgroundCell: UIView = {
        let back = UIView()
        back.backgroundColor = .specialBackground
        back.layer.cornerRadius = 12
        back.translatesAutoresizingMaskIntoConstraints = false
        return back
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "testWorkout")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override var isSelected: Bool {
        didSet {
            if self.isSelected {
                backgroundColor = .specialGreen
                
            } else {
                backgroundColor = .clear
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 10
        setupViews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupImage(name: String) {
        imageView.image = UIImage(named: name)?.withRenderingMode(.alwaysTemplate)
    }
    
    private func setupViews() {
        addSubview(backgroundCell)
        backgroundCell.addSubview(imageView)
    }
    
}

extension WorkoutCollectionCell {
    private func setupLayout() {
        NSLayoutConstraint.activate([
            backgroundCell.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            backgroundCell.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            backgroundCell.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            backgroundCell.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            imageView.topAnchor.constraint(equalTo: backgroundCell.topAnchor, constant: 10),
            imageView.leadingAnchor.constraint(equalTo: backgroundCell.leadingAnchor, constant:  10),
            imageView.trailingAnchor.constraint(equalTo: backgroundCell.trailingAnchor, constant: -10),
            imageView.bottomAnchor.constraint(equalTo: backgroundCell.bottomAnchor, constant: -10),
            
        ])
    }
}
