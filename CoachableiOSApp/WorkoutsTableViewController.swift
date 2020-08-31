//
//  WorkoutsTableViewController.swift
//  CoachableiOSApp
//
//  Created by Bhavan Srinathan on 2020-08-29.
//  Copyright © 2020 Bhavan Srinathan. All rights reserved.
//

import Foundation
import UIKit

final class WorkoutsTableViewController: UITableViewController {
    var workouts: [Workout] = []
    let service = WorkoutService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(WorkoutTableViewCell.self, forCellReuseIdentifier: WorkoutTableViewCell.identifier)
        getWorkouts()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let workout = workouts[indexPath.row]
        
        guard let workoutCell = tableView.dequeueReusableCell(withIdentifier: WorkoutTableViewCell.identifier, for: indexPath) as? WorkoutTableViewCell else {
            return tableView.dequeueReusableCell(withIdentifier: WorkoutTableViewCell.identifier, for: indexPath)
        }
        
        workoutCell.durationLabel.text = "\(String(workout.duration)) minutes"
        workoutCell.nameLabel.text = workout.title
        workoutCell.emojiLabel.text = "emoji"
        workoutCell.accessoryType = .disclosureIndicator
        
        return workoutCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let workout = workouts[indexPath.row]
        
        self.present(
            WorkoutViewController(workout: workout),
            animated: true,
            completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workouts.count
    }
    
    private func getWorkouts() {
        service.getWorkouts(completion: { [weak self] workouts in
            DispatchQueue.main.async {
                guard workouts.count > 0 else {
                    print("error occured")
                    return
                }
                
                self?.workouts = workouts
                self?.tableView.reloadData()
            }
        })
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
}

final class WorkoutTableViewCell: UITableViewCell {
    static let identifier = "WorkoutTableViewCell"
    
    let nameLabel = UILabel()
    let durationLabel = UILabel()
    let emojiLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    private func setupView() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        durationLabel.translatesAutoresizingMaskIntoConstraints = false
        emojiLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(durationLabel)
        contentView.addSubview(emojiLabel)
        
        nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        durationLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        durationLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        emojiLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        emojiLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
