//
//  SliderVIew.swift
//  Workout
//
//  Created by Айдар Оспанов on 06.03.2023.
//

import UIKit

protocol SliderViewProtocol: AnyObject {
    func changeValue(type: SliderType, value: Int)
}

enum SliderType {
    case sets
    case reps
    case timer
}

class SliderView: UIView {
    
    private let nameLabel = UILabel(text: "",
                                    font: .robotoMedium18(),
                                    textColor: .specialGray)
    
    private let numberLabel = UILabel(text: "0",
                                    font: .robotoMedium24(),
                                    textColor: .specialGray)
    
    private lazy var greenSlider = GreenSlider()
    
    private var stackView = UIStackView()
    
    private var sliderType: SliderType?
    
    weak var delegate: SliderViewProtocol?
    
    var isActive: Bool = true {
        didSet {
            if self.isActive {
                nameLabel.alpha = 1
                numberLabel.alpha = 1
                greenSlider.alpha = 1
            } else {
                nameLabel.alpha = 0.5
                numberLabel.alpha = 0.5
                greenSlider.alpha = 0.5
                greenSlider.setValue(0, animated: true) 
                numberLabel.text = "0"
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(name: String, maxValue: Float, type: SliderType) {
        self.init(frame: .zero)
        
        nameLabel.text = name
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = maxValue
        sliderType = type
        
        setupViews()
        setupLayout()
    }
    
    func resetValues() {
        numberLabel.text = "0"
        greenSlider.value = 0
        isActive = true
    }
    
    private func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false
        
        greenSlider.addTarget(self, action: #selector(sliderChanged), for: .valueChanged)
        
        let labelsStackView = UIStackView(arrangedSubviews: [nameLabel, numberLabel],
                                          axis: .horizontal,
                                          spacing: 10,
                                          distribution: .equalSpacing)
        
        stackView = UIStackView(arrangedSubviews: [labelsStackView, greenSlider],
                                axis: .vertical,
                                spacing: 10,
                                distribution: .fill)
        addSubview(stackView)
    }
    
    @objc private func sliderChanged() {
        let intValueSlider = Int(greenSlider.value)
        numberLabel.text = sliderType == .timer ? "\(intValueSlider.getTimerFromSeconds())" : "\(intValueSlider)"
        
        guard let type = sliderType else { return }
        delegate?.changeValue(type: type, value: intValueSlider)
    }
}

extension SliderView {
    private func setupLayout() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
