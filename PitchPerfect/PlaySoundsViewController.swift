//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Sarthak on 12/26/16.
//  Copyright © 2016 Sarthak. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    var recordedAudioURL: URL!
    
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!

   
    
    enum ButtonType: Int {
        case slow = 0, fast, chipmunk, vader, echo, reverb
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
    }

   
    
    
    @IBAction func playSoundForButton(_ sender: UIButton) {
    }
    
    @IBAction func stopButtonPressed(_ sender: AnyObject) {
        
    }
    
    

 
}
