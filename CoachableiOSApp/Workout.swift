//
//  Workout.swift
//  CoachableiOSApp
//
//  Created by Bhavan Srinathan on 2020-08-29.
//  Copyright © 2020 Bhavan Srinathan. All rights reserved.
//

import FirebaseDatabase
import FirebaseStorage
import Foundation

struct Workout {
    let title: String
    let duration: Double
    let description: String
    let audioFilePath: String
    let exercises: [Exercise]
    
    init?(json: [String: AnyObject]) {
        guard let title = json["title"] as? String,
            let duration = json["duration"] as? Double,
            let description = json["description"] as? String,
            let audioFilePath = json["audioFilePath"] as? String,
            let exercisesJSON = json["exercises"] as? [[String: AnyObject]] else {
                return nil
        }
        
        var exercises: [Exercise] = []
        
        for exercise in exercisesJSON {
            if let title = exercise["title"] as? String,
                let duration = exercise["duration"] as? Double {
                exercises.append(Exercise(title: title, duration: duration))
            }
        }
        
        self.title = title
        self.duration = duration
        self.description = description
        self.exercises = exercises
        self.audioFilePath = audioFilePath
    }
    
    func retrieveAudioURL(completion: @escaping (URL?) -> Void) {
        let audioReference = Storage.storage().reference(forURL: audioFilePath)
        
        audioReference.downloadURL { url, error in
            if let error = error {
                print("An error has occured when obtaining the URL. \(error.localizedDescription)")
                completion(nil)
            } else if let audioURL = url {
                completion(audioURL)
            } else {
                print("Empty URL returned with an undefined error.")
                completion(nil)
            }
        }
    }
}

struct Exercise {
    let title: String
    let duration: Double
}
