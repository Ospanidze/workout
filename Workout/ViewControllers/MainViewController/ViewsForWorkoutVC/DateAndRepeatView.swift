//
//  DateAndRepeatView.swift
//  Workout
//
//  Created by Айдар Оспанов on 01.03.2023.
//

import UIKit

class DateAndRepeatView: UIView {
    
    private var stackViewTop: UIStackView!
    private var stackViewBottom: UIStackView!
    
    private let dateAndRepeatLabel = UILabel(text: "Data and Repeat",
                                    font: UIFont.robotoMedium14())
    
    private let dateLabel = UILabel(text: "Date",
                                    font: UIFont.robotoMedium18(),
                                    textColor: .specialBlack)
    
    private let repeatLabel = UILabel(text: "Repeat every 7 days ",
                                      font: UIFont.robotoMedium18(),
                                      textColor: .specialBlack)
    
    private let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.tintColor = .specialGreen
        datePicker.datePickerMode = .date
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        return datePicker
    }()
    
    private let switchRepeat: UISwitch = {
        let switchRepeat = UISwitch()
        switchRepeat.onTintColor = .specialGreen
        switchRepeat.isOn = true
        switchRepeat.translatesAutoresizingMaskIntoConstraints = false
        return switchRepeat
    }()
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .specialLightBrown
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        
        setupStackViews()
        setupViews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getDateAndRepeat() -> (date: Date, isRepeat: Bool) {
        (datePicker.date, switchRepeat.isOn)
    }
    
    func resetDataAndRepeat() {
        datePicker.date = Date()
        switchRepeat.isOn = true
    }
    
    private func setupStackViews() {
        stackViewTop = UIStackView(arrangedSubviews: [dateLabel, datePicker],
                                   axis: .horizontal,
                                   spacing: 0,
                                   distribution: .equalCentering)
        
        stackViewBottom = UIStackView(arrangedSubviews: [repeatLabel, switchRepeat],
                                   axis: .horizontal,
                                   spacing: 0,
                                   distribution: .equalCentering)
    }
    
    private func setupViews() {
        addSubview(backgroundView)
        addSubview(dateAndRepeatLabel)
        backgroundView.addSubview(stackViewTop)
        backgroundView.addSubview(stackViewBottom)
    }
}

private extension DateAndRepeatView {
    private func setupLayout() {
        NSLayoutConstraint.activate([
            dateAndRepeatLabel.topAnchor.constraint(equalTo: topAnchor, constant: 7),
            dateAndRepeatLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            dateAndRepeatLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            dateAndRepeatLabel.heightAnchor.constraint(equalToConstant: 16),
            
            backgroundView.topAnchor.constraint(equalTo: dateAndRepeatLabel.bottomAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            stackViewTop.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 20),
            stackViewTop.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 10),
            stackViewTop.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -10),
            
            stackViewBottom.topAnchor.constraint(equalTo: backgroundView.centerYAnchor, constant: 5),
            stackViewBottom.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 10),
            stackViewBottom.trailingAnchor.constraint(equalTo:backgroundView.trailingAnchor, constant: -10),
        ])
    }
}

