//
//  ViewController.swift
//  simple-stop-watch-for-mac
//
//  Created by MasakiOkuno on 2018/10/10.
//  Copyright © 2018 masaki okuno. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var label: NSTextField!
    
    var timer: Timer!
    var isTimerWorking: Bool = false
    var startTime: Date!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tapButton(_ sender: NSButton) {
        if isTimerWorking {
            endTimer()
            sender.title = "START"
            sender.state = .off
        } else {
            startTimer()
            sender.title = "STOP"
            sender.state = .off
        }
        
    }
    
    func startTimer() {
        startTime = Date()
        timer = Timer.scheduledTimer(
            timeInterval: 1.0,
            target: self,
            selector: #selector(self.timerCounter),
            userInfo: nil,
            repeats: true
        )
        isTimerWorking = true
    }
    
    func endTimer() {
        if timer != nil {
            timer.invalidate()
            label.stringValue = "00:00:00"
        }
        isTimerWorking = false
    }
    
    @objc func timerCounter() {
        let currentTime = Date().timeIntervalSince(startTime)
        let hour   = Int(fmod(currentTime/3600, 60))
        let minute = Int(fmod(currentTime/60,   60))
        let second = Int(fmod(currentTime,      60))
        let hourValue   = String(format:"%02d", hour)
        let minuteValue = String(format:"%02d", minute)
        let secondValue = String(format:"%02d", second)
        label.stringValue = "\(hourValue):\(minuteValue):\(secondValue)"
    }
}


