//
//  CalendarCollectionViewCell.swift
//  Workout
//
//  Created by Айдар Оспанов on 25.02.2023.
//

import UIKit

class CalendarCollectionViewCell: UICollectionViewCell {
    
    private let dayOfWeekLabel: UILabel = {
        let label = UILabel()
        label.text = "We"
        label.font = .robotoBold16()
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let numberOfWeekLabel: UILabel = {
        let label = UILabel()
        label.text = "22"
        label.font = .robotoBold20()
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override var isSelected: Bool {
        didSet {
            if self.isSelected {
                backgroundColor = .specialYellow
                dayOfWeekLabel.textColor = .specialBlack
                numberOfWeekLabel.textColor = .specialDarkGreen
            } else {
                backgroundColor = .clear
                dayOfWeekLabel.textColor = .white
                numberOfWeekLabel.textColor = .white
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func dateForCell(numberOfDay: String, dayOfWeek: String) {
        numberOfWeekLabel.text = numberOfDay
        dayOfWeekLabel.text = dayOfWeek
    }
    
    
    private func setupViews() {
        layer.cornerRadius = 10
        
        addSubview(dayOfWeekLabel)
        addSubview(numberOfWeekLabel)
    }
}

private extension CalendarCollectionViewCell {
    func setLayout() {
        NSLayoutConstraint.activate([
            dayOfWeekLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            dayOfWeekLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            
            numberOfWeekLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            numberOfWeekLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
    }
}
