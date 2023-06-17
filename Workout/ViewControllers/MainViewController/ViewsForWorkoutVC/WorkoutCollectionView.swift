//
//  WorkkoutCollectionView.swift
//  Workout
//
//  Created by Айдар Оспанов on 16.03.2023.
//

import UIKit

protocol WorkoutCollectionViewDelegate: AnyObject {
    func getImage(_ photo: String)
}

class WorkoutCollectionView: UICollectionView {
    
    weak var workoutCollectionDelegate: WorkoutCollectionViewDelegate?
    
    private let images = ["imageCell1",
                          "imageCell2",
                          "imageCell3",
                          "imageCell4",
                          "imageCell5"]
    
    
    private let collectionLayout = UICollectionViewFlowLayout()
    
    private let idWorkoutCollectionCell = "idWorkoutCollectionCell"
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: collectionLayout)
        configure()
        setupCollectionLayout()
        setDelegate()
        register(WorkoutCollectionCell.self, forCellWithReuseIdentifier: idWorkoutCollectionCell)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .specialLightBrown
        layer.cornerRadius = 10
    }
    
    private func setupCollectionLayout() {
        collectionLayout.minimumInteritemSpacing = 3
        collectionLayout.scrollDirection = .horizontal
        collectionLayout.collectionView?.showsHorizontalScrollIndicator = false
    }
    
    private func setDelegate() {
        dataSource = self
        delegate = self
    }
}
 
extension WorkoutCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: idWorkoutCollectionCell, for: indexPath) as? WorkoutCollectionCell else {
            return UICollectionViewCell()
        }
        let imageName = images[indexPath.row]
        cell.setupImage(name: imageName)
        return cell
    }
}

extension WorkoutCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let photo = images[indexPath.row]
        print(photo)
        workoutCollectionDelegate?.getImage(photo)
    }
}

extension WorkoutCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 4,
               height: collectionView.frame.height)
    }
}
