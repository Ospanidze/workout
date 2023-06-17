//
//  WeatherView.swift
//  Workout
//
//  Created by Айдар Оспанов on 21.02.2023.
//

import UIKit


class WeatherView: UIView {
    
    let weatherImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "sun")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let weatherStatusLabel = UILabel(text: "Cолнечно",
                            font: .robotoBold16(),
                            textColor: .specialGray)
    
    let weatherDescriptionLabel = UILabel(text: "Хорошая погода, чтобы позаниматься на улице",
                                   font: .robotoMedium14(),
                                   textColor: .specialGray)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false 
        backgroundColor = .white
        layer.cornerRadius = 10
        
        setupShadowOnView()
        addSubview(weatherStatusLabel)
        addSubview(weatherDescriptionLabel)
        addSubview(weatherImageView)
    }
}

private extension WeatherView {
    func setLayout() {
        NSLayoutConstraint.activate([
            
            weatherImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            weatherImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            weatherImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8),
            weatherImageView.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8),
            
            weatherStatusLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            weatherStatusLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            weatherStatusLabel.trailingAnchor.constraint(equalTo: weatherImageView.leadingAnchor, constant: -20),
            
            weatherDescriptionLabel.topAnchor.constraint(equalTo: weatherStatusLabel.bottomAnchor, constant: 5),
            weatherDescriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            weatherDescriptionLabel.trailingAnchor.constraint(equalTo: weatherImageView.leadingAnchor, constant: -20),
        ])
    }
}
