//
//  RealManager.swift
//  Workout
//
//  Created by Айдар Оспанов on 09.03.2023.
//

import RealmSwift

class RealmManager {
    
    static let shared = RealmManager()
    private init() {}
    
    let realm = try! Realm()
    
    func getResultWorkoutModel() -> Results<Workout> {
        realm.objects(Workout.self)
    }
    
    func saveWorkoutModel(_ model: Workout) {
        try! realm.write {
            realm.add(model)
        }
    }
    
    func deleteWorkoutModel(_ model: Workout) {
        try! realm.write {
            realm.delete(model)
        }
    }
}
