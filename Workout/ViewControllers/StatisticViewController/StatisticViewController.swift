//
//  StatisticViewController.swift
//  Workout
//
//  Created by Айдар Оспанов on 20.02.2023.
//

import UIKit

final class StatisticViewController: UIViewController {
    
    private let statisticLabel: UILabel = {
        let label = UILabel()
        label.text = "STATISTIC"
        label.font = UIFont.robotoMedium24()
        label.textColor = .specialGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var segmentedControl: UISegmentedControl = {
        let segment = UISegmentedControl(items: ["неделя", "месяц"])
        segment.selectedSegmentTintColor = .specialYellow
        segment.backgroundColor = .specialGreen
        segment.selectedSegmentIndex = 0
        segment.addTarget(self, action: #selector(selectedChange), for: .valueChanged)
        segment.translatesAutoresizingMaskIntoConstraints = false
        return segment
    }()
    
    private let exercisesLabel = UILabel(text: "Exercises", font: .robotoMedium14())
    
    private let statisticTableView = StatisticTableView()
    
    private var workoutArray: [Workout] = []
    private var differenceArray: [DifferenceWorkout] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .specialBackground
        
        setupViews()
        setupLayout()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setStartScreen()
    }
    
    @objc private func selectedChange() {
        let dateToday = Date()
        differenceArray = [DifferenceWorkout]()
        
        let dateStart = segmentedControl.selectedSegmentIndex == 0
        ? dateToday.offSetDay(7)
        : dateToday.offSetMonth(1)
        getDiferenceModel(dateStart: dateStart)
        statisticTableView.reloadData()
    }
    
    private func setupViews() {
        view.addSubview(statisticLabel)
        view.addSubview(segmentedControl)
        view.addSubview(exercisesLabel)
        view.addSubview(statisticTableView)
    }
    
    private func getWorkoutsName() -> [String] {
        var nameArray = [String]()
        
        let allWorkouts = RealmManager.shared.getResultWorkoutModel()
        for workout in allWorkouts {
            if !nameArray.contains(workout.workoutName) {
                nameArray.append(workout.workoutName)
            }
        }
        return nameArray
    }
    
    private func getDiferenceModel(dateStart: Date) {
        let dateEnd = Date()
        let nameArray = getWorkoutsName()
        let allWorkouts = RealmManager.shared.getResultWorkoutModel()
        
        for name in nameArray {
            let predicateDifference = NSPredicate(format: "workoutName = '\(name)' AND workoutDate BETWEEN %@", [dateStart, dateEnd])
            let filtered = allWorkouts.filter(predicateDifference).sorted(byKeyPath: "workoutDate")
            workoutArray = filtered.map { $0 }
            
            guard let last = workoutArray.last?.workoutReps,
                  let first = workoutArray.first?.workoutReps else { return }
            let differenceWorkout = DifferenceWorkout(name: name, firstReps: first, lastReps: last)
            differenceArray.append(differenceWorkout)
        }
        statisticTableView.setDifferenceArray(differenceArray)
    }
    
    private func setStartScreen() {
        let dateToday = Date()
        differenceArray = [DifferenceWorkout]()
        getDiferenceModel(dateStart: dateToday.offSetDay(7))
        statisticTableView.reloadData()
    }
}

private extension StatisticViewController {
    func setupLayout() {
        NSLayoutConstraint.activate([
            statisticLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            statisticLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            segmentedControl.topAnchor.constraint(equalTo: statisticLabel.bottomAnchor, constant: 20),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            exercisesLabel.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 10),
            exercisesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            statisticTableView.topAnchor.constraint(equalTo: exercisesLabel.bottomAnchor),
            statisticTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            statisticTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            statisticTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
