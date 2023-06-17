//
//  BicepsView.swift
//  Workout
//
//  Created by Айдар Оспанов on 09.03.2023.
//

import UIKit

class BicepsView: UIView {
    
    private var stackViewTop = UIStackView()
    private var stackViewBottom = UIStackView()
    
    private let bicepsLabel = UILabel(text: "Biceps",
                                      font: .robotoBold20(),
                                      textAlignment: .center,
                                      textColor: .specialBlack)
    
    private let setsLabel = UILabel(text: "Sets",
                                    font: .robotoMedium18(),
                                    textColor: .specialBlack)
    
    private let repsLabel = UILabel(text: "Reps",
                                    font: .robotoMedium18(),
                                    textColor: .specialBlack)
    
    private let setsOfNumberLabel = UILabel(text: "1/4",
                                            font: .robotoMedium24(),
                                            textColor: .specialBlack)
    
    private let repsOfNumberLabel = UILabel(text: "20",
                                            font: .robotoMedium24(),
                                            textColor: .specialBlack)
    
    private let setsView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.specialLine.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let repsView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.specialLine.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var editingButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Editing", for: .normal)
        button.setImage(UIImage(named: "editing")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.titleLabel?.font = .robotoMedium16()
        button.tintColor = .specialBrown
        button.addTarget(self, action: #selector(editingButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var nextSetButton: UIButton = {
        let button = UIButton()
        button.setTitle("NEXT SET", for: .normal)
        button.setTitleColor(.specialBlack, for: .normal)
        button.backgroundColor = .specialYellow
        button.titleLabel?.font = .robotoBold16()
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(nextSetButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .specialLightBrown
        layer.cornerRadius = 10
        setupStackViews()
        setupViews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupStackViews() {
        stackViewTop = UIStackView(arrangedSubviews: [setsLabel, setsOfNumberLabel],
                                   axis: .horizontal,
                                   spacing: 10,
                                   distribution: .equalSpacing)
        
        stackViewBottom = UIStackView(arrangedSubviews: [repsLabel, repsOfNumberLabel],
                                   axis: .horizontal,
                                   spacing: 10,
                                   distribution: .equalSpacing)
    }
    
    private func setupViews() {
        addSubview(bicepsLabel)
        addSubview(stackViewTop)
        addSubview(stackViewBottom)
        addSubview(setsView)
        addSubview(repsView)
        addSubview(editingButton)
        addSubview(nextSetButton)
    }
    
    @objc private func editingButtonTapped() {
        
    }
    
    @objc private func nextSetButtonTapped() {
        
    }
}

extension BicepsView {
    private func setupLayout() {
        NSLayoutConstraint.activate([
            bicepsLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            bicepsLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            stackViewTop.topAnchor.constraint(equalTo: bicepsLabel.bottomAnchor, constant: 15),
            stackViewTop.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            stackViewTop.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            setsView.topAnchor.constraint(equalTo: stackViewTop.bottomAnchor),
            setsView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            setsView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            setsView.heightAnchor.constraint(equalToConstant: 1),
            
            stackViewBottom.topAnchor.constraint(equalTo: setsView.bottomAnchor, constant: 15),
            stackViewBottom.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            stackViewBottom.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            repsView.topAnchor.constraint(equalTo: stackViewBottom.bottomAnchor),
            repsView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            repsView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            repsView.heightAnchor.constraint(equalToConstant: 1),
            
            editingButton.topAnchor.constraint(equalTo: repsView.bottomAnchor, constant: 10),
            editingButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            nextSetButton.topAnchor.constraint(equalTo: editingButton.bottomAnchor, constant: 5),
            nextSetButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            nextSetButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            nextSetButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2),
        ])
    }
}
