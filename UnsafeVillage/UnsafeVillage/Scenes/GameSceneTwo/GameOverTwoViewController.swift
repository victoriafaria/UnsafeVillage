//
//  GameOverViewController.swift
//  UnsafeVillage
//
//  Created by Victoria Faria on 15/06/21.
//

import UIKit
import AVFoundation

class GameOverTwoViewController: UIViewController {

    @IBOutlet weak var bloodButton: UIButton!
    @IBOutlet weak var gameOverLabel: UILabel!
    @IBOutlet weak var slanderButton: UIButton!

    var gameBackgroundMusic = AVAudioPlayer()

    @IBAction func button(sender: UIButton){
        playSoundButton()
        bloodButton.isHidden = true
        slanderButton.isHidden = false
        setTyping(text: "AAAAAAAA MEU DEUUUSS!!!")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func playSoundButton() {
        let AssortedMusics = NSURL(fileURLWithPath: Bundle.main.path(forResource: "scream-3", ofType: "mp3")!)
        gameBackgroundMusic = try! AVAudioPlayer(contentsOf: AssortedMusics as URL)
        gameBackgroundMusic.prepareToPlay()
        gameBackgroundMusic.numberOfLoops = 0
        gameBackgroundMusic.play()
    }

    func setTyping(text: String, characterDelay: TimeInterval = 5.0) {
        gameOverLabel.text = ""

      let writingTask = DispatchWorkItem { [weak self] in
        text.forEach { char in
          DispatchQueue.main.async {
            self?.gameOverLabel?.text?.append(char)
          }
          Thread.sleep(forTimeInterval: characterDelay/100)
        }
      }

      let queue: DispatchQueue = .init(label: "typespeed", qos: .userInteractive)
      queue.asyncAfter(deadline: .now() + 0.05, execute: writingTask)
    }


}
