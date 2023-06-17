//
//  MainViewController.swift
//  Workout
//
//  Created by Айдар Оспанов on 20.02.2023.
//

import UIKit
import RealmSwift

class MainViewController: UIViewController {
    
    private let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = #colorLiteral(red: 0.7607843137, green: 0.7607843137, blue: 0.7607843137, alpha: 1)
        imageView.layer.borderWidth = 5
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Your name"
        label.font = .robotoMedium24()
        label.textColor = .specialGray
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var addWorkoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add workout", for: .normal)
        button.setImage(UIImage(named: "plus"), for: .normal)
        button.backgroundColor = .specialYellow
        button.tintColor = .specialDarkGreen
        button.titleLabel?.font = .robotoMedium12()
        button.layer.cornerRadius = 10
        button.imageEdgeInsets = .init(top: 0,
                                       left: 25,
                                       bottom: 15,
                                       right: 0)
        button.titleEdgeInsets = .init(top: 50,
                                       left: -40,
                                       bottom: 0,
                                       right: 0)
        button.setupShadowOnView()
        button.addTarget(self, action: #selector(addWorkoutButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let noWorkoutImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "noWorkout")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let calendarView = CalendarView()
    private let weatherView = WeatherView()
    private let workoutTodayLabel = UILabel(text: "Workout today", font: .robotoMedium12())
    
    private let tableView = MainTableView()
    
    private var workoutArray: [Workout] = []
    
    override func viewDidLayoutSubviews() {
        userImageView.layer.cornerRadius = userImageView.frame.width / 2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupLayout()
        selectItem(date: Date())
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
       selectItem(date: Date())
    }
    
    private func setupViews() {
        view.backgroundColor = .specialBackground
        
        view.addSubview(calendarView)
        calendarView.setDelegate(self)
        view.addSubview(userImageView)
        view.addSubview(userNameLabel)
        view.addSubview(addWorkoutButton)
        view.addSubview(weatherView)
        view.addSubview(workoutTodayLabel)
        view.addSubview(tableView)
        view.addSubview(noWorkoutImageView)
    }
    
    @objc private func addWorkoutButtonTapped() {
        let newWorkoutVC = NewWorkoutViewController()
        newWorkoutVC.modalPresentationStyle = .fullScreen
        present(newWorkoutVC, animated: true)
    }
}

//MARK: CalendarViewProtocol

extension MainViewController: CalendarViewProtocol {
    func selectItem(date: Date) {
        getWorkouts(date: date)
        tableView.setWorkoutArray(workoutArray)
        tableView.reloadData()
        checkWorkoutToday()
    }
}

extension MainViewController {
    private func getWorkouts(date: Date) {
        
        
        let weekday = date.getWeekDayNumber()
//        let calendar = Calendar.current
//        let components = calendar.dateComponents([.weekday], from: date)
//        guard let weekday = components.weekday else { return }
//
        let dateStart = date.startEndDate().start
        let dateEnd = date.startEndDate().end
        
        let predicateRepeat = NSPredicate(format: "workoutNumberOfDay = \(weekday) AND workoutRepeat = true")
        let predicateUnrepeat = NSPredicate(format: "workoutRepeat = false AND workoutDate BETWEEN %@", [dateStart, dateEnd])
        let compound = NSCompoundPredicate(type: .or, subpredicates: [predicateRepeat, predicateUnrepeat])
        
        let resultArray = RealmManager.shared.getResultWorkoutModel()
        
        let filteredArray = resultArray.filter(compound).sorted(byKeyPath: "workoutName")
        workoutArray = filteredArray.map { $0 }
    }
    
    private func checkWorkoutToday() {
        noWorkoutImageView.isHidden = !workoutArray.isEmpty
        tableView.isHidden = workoutArray.isEmpty
    }
}

extension MainViewController: MainTableViewDelegate {
    func deleteWorkout(model: Workout, index: Int) {
        RealmManager.shared.deleteWorkoutModel(model)
        workoutArray.remove(at: index)
        tableView.setWorkoutArray(workoutArray)
        tableView.reloadData()
    }
}

extension MainViewController: WorkoutCellProtocol {
    func startButton(model: Workout) {
        let startVC = StartWorkoutViewController()
        startVC.modalPresentationStyle = .fullScreen
        present(startVC, animated: true)
//        if model.workoutTimer == 0 {
//            let startVC = StartWorkoutViewController()
//            startVC.modalPresentationStyle = .fullScreen
//            present(startVC, animated: true)
//        } else {
//            print("timer")
//        }
    }
}

//MARK: Extension SetupLayout

private extension MainViewController {
    func setupLayout() {
        NSLayoutConstraint.activate([
            userImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            userImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            userImageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.23),
            userImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.23),
            
            calendarView.topAnchor.constraint(equalTo: userImageView.centerYAnchor),
            calendarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            calendarView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            calendarView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.19),
            
            userNameLabel.bottomAnchor.constraint(equalTo: calendarView.topAnchor, constant: -10),
            userNameLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 10),
            userNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            addWorkoutButton.topAnchor.constraint(equalTo: calendarView.bottomAnchor, constant: 5),
            addWorkoutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            addWorkoutButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.22),
            addWorkoutButton.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.23),
            
            weatherView.topAnchor.constraint(equalTo: calendarView.bottomAnchor, constant: 5),
            weatherView.leadingAnchor.constraint(equalTo: addWorkoutButton.trailingAnchor, constant: 10),
            weatherView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            weatherView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.23),
            
            workoutTodayLabel.topAnchor.constraint(equalTo: weatherView.bottomAnchor, constant: 10),
            workoutTodayLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            workoutTodayLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            tableView.topAnchor.constraint(equalTo: workoutTodayLabel.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            noWorkoutImageView.topAnchor.constraint(equalTo: workoutTodayLabel.bottomAnchor),
            noWorkoutImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            noWorkoutImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            noWorkoutImageView.heightAnchor.constraint(equalTo: noWorkoutImageView.widthAnchor, multiplier: 1)
        ])
    }
}
