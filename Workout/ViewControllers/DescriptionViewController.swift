//
//  ViewController.swift
//  Workout
//
//  Created by Айдар Оспанов on 20.02.2023.
//

import UIKit

final class DescriptionViewController: UIViewController {
    
    private var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "onboardingFirst")
        imageView.contentMode = .scaleAspectFill
        //imageView.backgroundColor = .red
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("NEXT", for: .normal)
        button.setTitleColor(.specialGreen, for: .normal)
        button.backgroundColor = .white
        button.titleLabel?.font = .robotoBold20()
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 3
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
    
    private var count = 0
    
    private var titleLabel = UILabel(text: "Have a good health", font: .robotoBold24(), textAlignment: .center, textColor: .specialGreen)
                
    private var descriptionLabel = UILabel(
        text:"Being healthy is all, no health is nothing. So why do not we",
        font: .robotoMedium14(),
        textAlignment: .center,
        textColor: .white
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .specialGreen
        setupView()
        setLayout()
    }
    
    @objc private func startButtonTapped() {
        count += 1
        setupLogic()
        
        if count == 3 {
            let tabBarController = TabBarController()
            tabBarController.modalPresentationStyle = .fullScreen
            present(tabBarController, animated: true)
        }
    }
    
    private func setupView() {
        view.addSubview(backgroundImageView)
        view.addSubview(button)
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(pageControl)
    }
    
    private func setLayout() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: 40),
            
            button.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            button.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            button.heightAnchor.constraint(equalToConstant: 50),
            
            
            
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            pageControl.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -10),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            descriptionLabel.bottomAnchor.constraint(equalTo: pageControl.topAnchor, constant: -50),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 75),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -75),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
}

extension DescriptionViewController {
    func setupLogic() {
        if count == 1 {
            titleLabel.text = "Be stronger"
            backgroundImageView.image = UIImage(named: "onboardingSecond")
            descriptionLabel.text = "Take 30 minutes of bodybuilding every day to get physically fit and healthy."
            pageControl.currentPage = 1
        } else if count == 2 {
            titleLabel.text = "Have a nice body"
            backgroundImageView.image = UIImage(named: "onboardingThird")
            descriptionLabel.text = "Bad body shape, poor sleep, lack of strength, weight gain, weak bones, easily traumatized body, depressed, stressed, poor metabolism, poor resistance"
            button.setTitle("Start", for: .normal)
            pageControl.currentPage = 2
        }
    }
}
