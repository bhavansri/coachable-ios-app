//
//  WorkoutViewController.swift
//  CoachableiOSApp
//
//  Created by Bhavan Srinathan on 2020-08-29.
//  Copyright © 2020 Bhavan Srinathan. All rights reserved.
//

import Foundation
import UIKit

final class WorkoutViewController: UIViewController {
    
    let workout: Workout
    
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    let durationLabel = UILabel()
    let exercisesTableView = UITableView()
    let startButton = ButtonComponent(title: "Start", color: .blue, size: .large)
    
    init(workout: Workout) {
        self.workout = workout
        
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        exercisesTableView.register(UITableViewCell.self, forCellReuseIdentifier: "exerciseCell")
        exercisesTableView.delegate = self
        exercisesTableView.dataSource = self
        
        setupViews()
    }
    
    private func setupViews() {
        descriptionLabel.numberOfLines = 0
        exercisesTableView.separatorStyle = .none
        startButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didPressStartButton)))
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        durationLabel.translatesAutoresizingMaskIntoConstraints = false
        startButton.translatesAutoresizingMaskIntoConstraints = false
        exercisesTableView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(exercisesTableView)
        view.addSubview(durationLabel)
        view.addSubview(startButton)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25),
            titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25)
        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            descriptionLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25),
            descriptionLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25)
        ])
        
        NSLayoutConstraint.activate([
            exercisesTableView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            exercisesTableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25),
            exercisesTableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25),
            exercisesTableView.heightAnchor.constraint(equalToConstant: 250)
        ])
        
        NSLayoutConstraint.activate([
            durationLabel.topAnchor.constraint(equalTo: exercisesTableView.bottomAnchor, constant: 20),
            durationLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25),
            durationLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25)
        ])
        
        NSLayoutConstraint.activate([
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -25)
        ])
        
        titleLabel.text = workout.title
        descriptionLabel.text = workout.description
        durationLabel.text = String(workout.duration)
    }
    
    @objc private func didPressStartButton() {
        workout.retrieveAudioURL() { [weak self] url in
            guard let `self` = self, let audioURL = url else {
                return
            }
            
            let playerViewController = PlayerViewController(
                title: self.workout.title,
                audioURL: audioURL)
            self.navigationController?.pushViewController(playerViewController, animated: true)
        }
    }
}

extension WorkoutViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workout.exercises.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "exerciseCell", for: indexPath)
        
        let title = workout.exercises[indexPath.row].title
        let duration = workout.exercises[indexPath.row].duration
        
        cell.textLabel?.text = "\(title), \(duration)"
        return cell
    }
}
