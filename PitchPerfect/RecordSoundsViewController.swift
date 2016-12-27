//
//  RecordSoundsViewController.swift
//  PitchPerfect
//
//  Created by Sarthak on 12/23/16.
//  Copyright © 2016 Sarthak. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {
    var audioRecorder: AVAudioRecorder!

    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var r: UILabel!
    @IBOutlet weak var stopRecordingButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        stopRecordingButton.isEnabled=false
    }
    
    func setUIState(isRecording:Bool, recordingText:String)
    {
        r.text = recordingText
        stopRecordingButton.isEnabled = isRecording
        recordButton.isEnabled = !isRecording
    }

    @IBAction func record(_ sender: UIButton) {
        
        setUIState(isRecording: true, recordingText: "Recording in Progress")
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with:AVAudioSessionCategoryOptions.defaultToSpeaker)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate=self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }

    @IBAction func stopRecording(_ sender: Any) {
        setUIState(isRecording: false, recordingText: "Tap to Record")
        audioRecorder.stop()
        let audioSession=AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if(flag){
            performSegue(withIdentifier: "stopRecording", sender:audioRecorder.url)
        }
        else{
            let alert = UIAlertController(title: "Alert", message: "Recording Failed", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier=="stopRecording"){
          let playSoundsVC=segue.destination as! PlaySoundsViewController
          let recordedAudioURL=sender as! URL
          playSoundsVC.recordedAudioURL=recordedAudioURL
            
        }
    }
}

