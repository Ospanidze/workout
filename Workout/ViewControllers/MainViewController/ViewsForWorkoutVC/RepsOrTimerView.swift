//
//  RepsOrTimerView.swift
//  Workout
//
//  Created by Айдар Оспанов on 01.03.2023.
//

import UIKit

class RepsOrTimerView: UIView {
    
    private var stackView = UIStackView()

    private let backgroundView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .specialLightBrown
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let repsOrTimerLabel = UILabel(text: "Reps or Timer",
                                    font: UIFont.robotoMedium14())
    
    private let setsView = SliderView(name: "Sets", maxValue: 10, type: .sets)
    private let repsView = SliderView(name: "Reps", maxValue: 50, type: .reps)
    private let timerView = SliderView(name: "Timer", maxValue: 600, type: .timer)
    
    
    private let chooseRepeatOrTimerLabel = UILabel(text: "Choose repeat or timer",
                                                   font: UIFont.robotoMedium14())
    
    var (sets, reps, timer) = (0, 0, 0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        chooseRepeatOrTimerLabel.textAlignment = .center
        setupStackView()
        setupViews()
        setupLayout()
        setupDelegates()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func resetSliderViewValues() {
        setsView.resetValues()
        repsView.resetValues()
        timerView.resetValues()
    }
    
    private func setupStackView() {
        stackView = UIStackView(arrangedSubviews: [setsView, chooseRepeatOrTimerLabel, repsView,  timerView],
                                   axis: .vertical,
                                   spacing: 10,
                                   distribution: .fill)
        
    }
    
    private func setupViews() {
        addSubview(repsOrTimerLabel)
        addSubview(backgroundView)
        addSubview(stackView)
    }
    
    private func setupDelegates() {
        setsView.delegate = self
        repsView.delegate = self
        timerView.delegate = self
    }
}

extension RepsOrTimerView: SliderViewProtocol {
    func changeValue(type: SliderType, value: Int) {
        switch type {
        case .sets:
            sets = value
        case .reps:
            reps = value
            repsView.isActive = true
            timerView.isActive = false
            timer = 0
        case .timer:
            timer = value
            timerView.isActive = true
            repsView.isActive = false
            reps = 0
        }
    }
}

private extension RepsOrTimerView {
    private func setupLayout() {
        NSLayoutConstraint.activate([
            repsOrTimerLabel.topAnchor.constraint(equalTo: topAnchor, constant: 7),
            repsOrTimerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            repsOrTimerLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            //repsOrTimerLabel.heightAnchor.constraint(equalToConstant: 16),
            
            backgroundView.topAnchor.constraint(equalTo: repsOrTimerLabel.bottomAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            stackView.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -15),
        ])
    }
}
