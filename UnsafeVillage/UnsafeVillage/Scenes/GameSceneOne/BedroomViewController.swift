//
//  BedroomViewController.swift
//  UnsafeVillage
//
//  Created by Victoria Faria on 15/06/21.
//

import UIKit
import AVFoundation

public class BedroomViewController: UIViewController {

    @IBOutlet weak var iPhoneButton: UIButton!
    @IBOutlet weak var aloLabel: UILabel!
    @IBOutlet weak var openButton: UIButton!
    @IBOutlet weak var slenderButton: UIButton!

    var gameBackgroundMusic = AVAudioPlayer()

    @IBAction func button(sender: UIButton){
        iPhoneButton.isHidden = true
        playSoundButton()
        setTyping(text: "ALo.... alo....que barulho estranho!")
    }

    @IBAction func open(sender: UIButton){
        iPhoneButton.isHidden = true
        openButton?.isHidden = true
        slenderButton.isHidden = false
        playSoundScream()
    }

    public override func viewDidLoad() {
        super.viewDidLoad()

    }

    func playSoundButton() {
        let AssortedMusics = NSURL(fileURLWithPath: Bundle.main.path(forResource: "button-sound", ofType: "mp3")!)
        gameBackgroundMusic = try! AVAudioPlayer(contentsOf: AssortedMusics as URL)
        gameBackgroundMusic.prepareToPlay()
        gameBackgroundMusic.numberOfLoops = 0
        gameBackgroundMusic.play()
    }

    func playSoundScream() {
        let AssortedMusics = NSURL(fileURLWithPath: Bundle.main.path(forResource: "scream-3", ofType: "mp3")!)
        gameBackgroundMusic = try! AVAudioPlayer(contentsOf: AssortedMusics as URL)
        gameBackgroundMusic.prepareToPlay()
        gameBackgroundMusic.numberOfLoops = 0
        gameBackgroundMusic.play()
    }

    func setTyping(text: String, characterDelay: TimeInterval = 5.0) {
        aloLabel.text = ""

      let writingTask = DispatchWorkItem { [weak self] in
        text.forEach { char in
          DispatchQueue.main.async {
            self?.aloLabel?.text?.append(char)
          }
          Thread.sleep(forTimeInterval: characterDelay/100)
        }
      }

      let queue: DispatchQueue = .init(label: "typespeed", qos: .userInteractive)
      queue.asyncAfter(deadline: .now() + 0.05, execute: writingTask)
    }

}
