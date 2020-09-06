//
//  PlayerViewController.swift
//  CoachableiOSApp
//
//  Created by Bhavan Srinathan on 2020-08-31.
//  Copyright © 2020 Bhavan Srinathan. All rights reserved.
//

import UIKit

class PlayerViewController: UIViewController {

    var workoutTitle: String = ""
    var audioURL: URL?
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var playerSlider: UISlider!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var rewindButton: UIButton!
    @IBOutlet weak var fastForwardButton: UIButton!
    
    init(title: String, audioURL: URL) {
        super.init(nibName: "PlayerViewController", bundle: nil)
        
        self.workoutTitle = title
        self.audioURL = audioURL
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    private func setupViews() {
        titleLabel.text = workoutTitle
        timerLabel.text = "00:00"
        playerSlider.value = 0
    }
    
    @IBAction func didPressPlayPauseAction(_ sender: Any) {
    }
    
    @IBAction func didPressForwardButton(_ sender: Any) {
    }
    
    @IBAction func didPressBackwardButton(_ sender: Any) {
    }
}
