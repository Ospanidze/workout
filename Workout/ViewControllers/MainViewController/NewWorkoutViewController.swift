//
//  NewWorkoutViewController.swift
//  Workout
//
//  Created by Айдар Оспанов on 01.03.2023.
//

import UIKit

final class NewWorkoutViewController: UIViewController {
    
    private let newWorkoutLabel: UILabel = {
        let label = UILabel()
        label.text = "NEW WORKOUT"
        label.font = UIFont.robotoMedium24()
        label.textColor = .specialGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
//    private lazy var backButton: UIButton = {
//        let button = UIButton()
//        button.setImage(UIImage(named: "closeButton"), for: .normal)
//        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
    
    private lazy var backButton = CloseButton()
    
    private lazy var saveButton = UIButton(name: "SAVE")
    
    
    private let nameView = NameView()
    private let collectionView = WorkoutCollectionView()
    private let dateAndRepeatView = DateAndRepeatView()
    private let repsOrTimerView = RepsOrTimerView()
    
    private var workout = Workout()
    private var testImage = UIImage(named: "testWorkout")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .specialBackground
        collectionView.workoutCollectionDelegate = self
        backButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        setupViews()
        setupLayout()
        //addGesture()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    private func setupViews() {
        view.addSubview(newWorkoutLabel)
        view.addSubview(backButton)
        view.addSubview(nameView)
        view.addSubview(collectionView)
        view.addSubview(dateAndRepeatView)
        view.addSubview(repsOrTimerView)
        view.addSubview(saveButton)
    }
    
    @objc private func closeButtonTapped() {
       dismiss(animated: true)
    }
    
    @objc private func saveButtonTapped() {
        setModel()
        saveModel()
    }
    
    private func setModel() {
        let date = dateAndRepeatView.getDateAndRepeat().date
        
        workout.workoutName = nameView.getNameTextField()
        workout.workoutDate = date
        workout.workoutRepeat = dateAndRepeatView.getDateAndRepeat().isRepeat
        workout.workoutNumberOfDay = date.getWeekDayNumber()
        workout.workoutSets = repsOrTimerView.sets
        workout.workoutReps = repsOrTimerView.reps
        workout.workoutTimer = repsOrTimerView.timer
        
        guard let imageData = testImage?.pngData() else { return }
        workout.workoutImage = imageData
    }
    
    private func saveModel() {
        let text = nameView.getNameTextField()
        let count = text.filter { $0.isNumber || $0.isLetter }.count
        
        if count != 0 && workout.workoutSets != 0 && (workout.workoutReps != 0 || workout.workoutTimer != 0) {
            RealmManager.shared.saveWorkoutModel(workout)
            presentSimpleAlert(title: "Success", message: nil)
            workout = Workout()
            resetValues()
        } else {
            presentSimpleAlert(title: "Error", message: "Enter all parameters")
        }
    }
    
    private func resetValues() {
        nameView.deleteTextTextField()
        dateAndRepeatView.resetDataAndRepeat()
        repsOrTimerView.resetSliderViewValues()
    }
    
//    private func addGesture() {
//        let tapScreen = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
//        view.addGestureRecognizer(tapScreen)
//
//        let swipeScreen = UISwipeGestureRecognizer(target: self, action: #selector(hideKeyboard))
//        swipeScreen.cancelsTouchesInView = false
//        view.addGestureRecognizer(swipeScreen)
//    }
//
//    @objc private func hideKeyboard() {
//        view.endEditing(true)
//    }
}

extension NewWorkoutViewController: WorkoutCollectionViewDelegate {
    func getImage(_ photo: String) {
        testImage = UIImage(named: photo)
    }
}

private extension NewWorkoutViewController {
    func setupLayout() {
        NSLayoutConstraint.activate([
            newWorkoutLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            newWorkoutLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            backButton.centerYAnchor.constraint(equalTo: newWorkoutLabel.centerYAnchor),
            backButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            nameView.topAnchor.constraint(equalTo: newWorkoutLabel.bottomAnchor, constant: 15),
            nameView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            nameView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            nameView.heightAnchor.constraint(equalToConstant: 60),
            
            collectionView.topAnchor.constraint(equalTo: nameView.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            collectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
            
            dateAndRepeatView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 10),
            dateAndRepeatView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            dateAndRepeatView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            dateAndRepeatView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.33),
            
            repsOrTimerView.topAnchor.constraint(equalTo: dateAndRepeatView.bottomAnchor, constant: 15),
            repsOrTimerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            repsOrTimerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            repsOrTimerView.heightAnchor.constraint(equalTo: repsOrTimerView.widthAnchor, multiplier: 0.85),
            
            saveButton.topAnchor.constraint(equalTo: repsOrTimerView.bottomAnchor, constant: 20),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            saveButton.heightAnchor.constraint(equalTo: nameView.heightAnchor)
        ])
    }
}
