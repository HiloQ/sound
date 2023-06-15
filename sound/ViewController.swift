//
//  ViewController.swift
//  sound
//
//  Created by Jakub Sukiennim on 15/06/2023.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {

    var player = AVAudioPlayer()
    let audio = Bundle.main.path(forResource: "dzwiek", ofType: "mp3")
    var timer = Timer()
    
    @objc func uptadescrubber(){
        time.value = Float(player.currentTime)
        
    }
    
    @IBAction func play(_ sender: Any) {
        player.play()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.uptadescrubber), userInfo: nil, repeats: true)
    }
    
    
    @IBAction func volumechange(_ sender: Any) {
        player.volume = volume.value
    }
    
   
    @IBOutlet weak var volume: UISlider!
    
    
    @IBAction func timechanche(_ sender: Any) {
        player.currentTime = TimeInterval(time.value)
    }
    
    @IBAction func pause(_ sender: Any) {
        player.pause()
        timer.invalidate()
    }
    @IBOutlet weak var time: UISlider!
    
    
    @IBAction func stop(_ sender: Any) {
        timer.invalidate()
        player.pause()
        time.value = 0
        do{
            
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audio!))
            
        }catch{
            //error
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do{
            
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audio!))
            time.value = Float(player.duration)
        }catch{
            //error
        }
    }


}

