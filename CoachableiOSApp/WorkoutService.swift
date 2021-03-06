//
//  WorkoutService.swift
//  CoachableiOSApp
//
//  Created by Bhavan Srinathan on 2020-08-29.
//  Copyright © 2020 Bhavan Srinathan. All rights reserved.
//

import AVFoundation
import FirebaseDatabase
import FirebaseStorage
import Foundation

class WorkoutService {
    
    let firebaseReference: DatabaseReference!
    
    init() {
        firebaseReference = Database.database().reference()
    }
    
    func getWorkouts(completion: @escaping ([Workout]) -> Void) {
        var workouts: [Workout] = []
        let workoutsReference = firebaseReference.child("workouts")
        
        workoutsReference.observe(.value, with: { snapshot in
            for child in snapshot.children {
                if let snapshot = child as? DataSnapshot,
                    let json = snapshot.value as? [String: AnyObject] {
                    if let workout = Workout(json: json) {
                        workouts.append(workout)
                    }
                }
            }
            
            completion(workouts)
        })
    }
}
