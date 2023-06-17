//
//  TestViewController.swift
//  Workout
//
//  Created by Айдар Оспанов on 03.03.2023.
//

import UIKit

class TestViewController: UIViewController {
    
//    private var backgroundImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.image = UIImage(named: "onboardingFirst")
//        imageView.contentMode = .scaleAspectFill
//        //imageView.backgroundColor = .red
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        return imageView
//    }()
    
    let strings = ["onboardingFirst", "onboardingSecond", "onboardingThird"]
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .yellow
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width * 3, height: scrollView.frame.height)
        scrollView.isPagingEnabled = true
        //scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var startButton: UIButton = {
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .specialGreen
        setupView()
        setLayout()
        
//        addImageView(title: strings[0], position: 0)
//        addImageView(title: strings[1], position: 1)
//        addImageView(title: strings[2], position: 2)
        scrollView.delegate = self
    }
    
    private func setupView() {
        view.addSubview(scrollView)
        view.addSubview(pageControl)
        view.addSubview(startButton)
        
    }
    
    @objc private func startButtonTapped() {
        
    }
}

extension TestViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / UIScreen.main.bounds.width)
    }
}

extension TestViewController {
    private func addImageView(title: String, position: CGFloat) {
        let imageView = UIImageView()
        imageView.image = UIImage(named: title)
        imageView.contentMode = .scaleAspectFill
    
        
        scrollView.addSubview(imageView)
        let screenWidth = UIScreen.main.bounds.width
        imageView.frame = CGRect(x: screenWidth * position, y: 0, width: screenWidth, height: scrollView.frame.height)
    }
}

extension TestViewController {
    private func setLayout() {
        NSLayoutConstraint.activate([
            startButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            startButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            startButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            startButton.heightAnchor.constraint(equalToConstant: 50),
            
            pageControl.bottomAnchor.constraint(equalTo: startButton.topAnchor, constant: -10),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: pageControl.topAnchor, constant: -20),

        ])
    }
}

