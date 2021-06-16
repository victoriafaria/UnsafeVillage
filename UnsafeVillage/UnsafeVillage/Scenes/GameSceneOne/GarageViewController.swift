//
//  GarageViewController.swift
//  UnsafeVillage
//
//  Created by Victoria Faria on 15/06/21.
//

import UIKit
import AVFoundation

class GarageViewController: UIViewController {

    @IBOutlet weak var keyButton: UIButton!
    @IBOutlet weak var keyLabel: UILabel!

    var openCloset = BedroomViewController()

    var gameBackgroundMusic = AVAudioPlayer()

    @IBAction func button(sender: UIButton){
        keyButton.isHidden = true
        setTyping(text: "Voce encontrou a chave para abrir o armario no quarto!")
        playSoundButton()
//        openCloset.openButton.isHidden = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    func playSoundButton() {
        let AssortedMusics = NSURL(fileURLWithPath: Bundle.main.path(forResource: "button-sound", ofType: "mp3")!)
        gameBackgroundMusic = try! AVAudioPlayer(contentsOf: AssortedMusics as URL)
        gameBackgroundMusic.prepareToPlay()
        gameBackgroundMusic.numberOfLoops = 0
        gameBackgroundMusic.play()
    }

    func setTyping(text: String, characterDelay: TimeInterval = 5.0) {
        keyLabel.text = ""

      let writingTask = DispatchWorkItem { [weak self] in
        text.forEach { char in
          DispatchQueue.main.async {
            self?.keyLabel?.text?.append(char)
          }
          Thread.sleep(forTimeInterval: characterDelay/100)
        }
      }

      let queue: DispatchQueue = .init(label: "typespeed", qos: .userInteractive)
      queue.asyncAfter(deadline: .now() + 0.05, execute: writingTask)
    }
}
