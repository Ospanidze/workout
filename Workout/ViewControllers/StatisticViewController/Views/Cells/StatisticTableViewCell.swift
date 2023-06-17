//
//  StatisticTableViewCell.swift
//  Workout
//
//  Created by Айдар Оспанов on 01.03.2023.
//

import UIKit

class StatisticTableViewCell: UITableViewCell {
    static let idStatisticTableViewCell = "idStatisticTableViewCell"
    
    var stackView: UIStackView!
    
    private let workoutNameLabel = UILabel(text: "PullUps", font: .robotoMedium24(), textColor: .specialBlack)
    
    private let beforeLabel = UILabel(text: "Before: 18", font: .robotoMedium14())
    
    private let nowLabel = UILabel(text: "Now: 20", font: .robotoMedium14())
    
    private let numberLabel = UILabel(text: "+2", font: .robotoBold24(), textColor: .specialGreen)
    
    private let viewBorder: UIView = {
        let view = UIView()
        view.backgroundColor = .specialLine
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        selectionStyle = .none
        
        setupViews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(deffirenceWorkout: DifferenceWorkout) {
        workoutNameLabel.text = deffirenceWorkout.name
        beforeLabel.text = "Before: \(deffirenceWorkout.firstReps)"
        nowLabel.text = "Now: \(deffirenceWorkout.lastReps)"
        
        let deffirence = deffirenceWorkout.lastReps - deffirenceWorkout.firstReps
        numberLabel.text = "\(deffirence)"
        
        switch deffirence {
        case ..<0: numberLabel.textColor = .specialGreen
        case 1...: numberLabel.textColor = .specialYellow
        default: numberLabel.textColor = .specialGray
        }
    }
    
    private func setupViews() {
        stackView = UIStackView(arrangedSubviews: [beforeLabel, nowLabel],
                                axis: .horizontal,
                                spacing: 10,
                                distribution: .fill)
        
        addSubview(workoutNameLabel)
        addSubview(numberLabel)
        addSubview(stackView)
        addSubview(viewBorder)
    }
}

private extension StatisticTableViewCell {
    func setupLayout() {
        NSLayoutConstraint.activate([
            workoutNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            workoutNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            workoutNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            stackView.topAnchor.constraint(equalTo: workoutNameLabel.bottomAnchor, constant: 5),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4),
            
            numberLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            numberLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            viewBorder.bottomAnchor.constraint(equalTo: bottomAnchor),
            viewBorder.leadingAnchor.constraint(equalTo: leadingAnchor),
            viewBorder.trailingAnchor.constraint(equalTo: trailingAnchor),
            viewBorder.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}
