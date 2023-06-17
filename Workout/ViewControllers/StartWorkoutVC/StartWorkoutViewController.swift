//
//  StartWorkoutViewController.swift
//  Workout
//
//  Created by Айдар Оспанов on 09.03.2023.
//

import UIKit

final class StartWorkoutViewController: UIViewController {
    
    private let startWorkoutLabel: UILabel = {
        let label = UILabel()
        label.text = "START WORKOUT"
        label.font = UIFont.robotoMedium24()
        label.textColor = .specialGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "sportsman")
        imageView.contentMode = .scaleAspectFit
        //imageView.backgroundColor = .red
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let detailsLabel = UILabel(text: "Details", font: .robotoMedium14())
    
    private lazy var backButton = CloseButton()
    
    private lazy var finishButton = UIButton(name: "FINISH")
    
    private let bicepsView = BicepsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .specialBackground
        backButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        finishButton.addTarget(self, action: #selector(finishButtonTapped), for: .touchUpInside)
        setupViews()
        setupLayout()
    }
    
    private func setupViews() {
        view.addSubview(startWorkoutLabel)
        view.addSubview(backgroundImageView)
        view.addSubview(detailsLabel)
        view.addSubview(backButton)
        view.addSubview(finishButton)
        view.addSubview(bicepsView)
    }
    
    @objc private func closeButtonTapped() {
       dismiss(animated: true)
    }
    
    @objc private func finishButtonTapped() {
        
    }
    
   
}

private extension StartWorkoutViewController {
    func setupLayout() {
        NSLayoutConstraint.activate([
            startWorkoutLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            startWorkoutLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            backButton.centerYAnchor.constraint(equalTo: startWorkoutLabel.centerYAnchor),
            backButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            backgroundImageView.topAnchor.constraint(equalTo: startWorkoutLabel.bottomAnchor, constant: 15),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            backgroundImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.32),
            
            detailsLabel.topAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: 15),
            detailsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            detailsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            bicepsView.topAnchor.constraint(equalTo: detailsLabel.bottomAnchor),
            bicepsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            bicepsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            bicepsView.heightAnchor.constraint(equalTo: bicepsView.widthAnchor, multiplier: 0.61),
            
            finishButton.topAnchor.constraint(equalTo: bicepsView.bottomAnchor, constant: 20),
            finishButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            finishButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            finishButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07),
        ])
    }
}

