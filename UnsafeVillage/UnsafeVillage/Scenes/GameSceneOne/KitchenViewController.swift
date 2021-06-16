//
//  KitchenViewController.swift
//  UnsafeVillage
//
//  Created by Victoria Faria on 15/06/21.
//

import UIKit
import AVFoundation

class KitchenViewController: UIViewController {

    @IBOutlet weak var fruitButton: UIButton!
    @IBOutlet weak var kitchenLabel: UILabel!

    var gameBackgroundMusic = AVAudioPlayer()

    @IBAction func button(sender: UIButton){
        playSoundButton()
        fruitButton.isHidden = true
        setTyping(text: "Deixaram a caixa aberta? hmm...")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func playSoundButton() {
        let AssortedMusics = NSURL(fileURLWithPath: Bundle.main.path(forResource: "button-sound", ofType: "mp3")!)
        gameBackgroundMusic = try! AVAudioPlayer(contentsOf: AssortedMusics as URL)
        gameBackgroundMusic.prepareToPlay()
        gameBackgroundMusic.numberOfLoops = 0
        gameBackgroundMusic.play()
    }

    func setTyping(text: String, characterDelay: TimeInterval = 5.0) {
        kitchenLabel.text = ""

      let writingTask = DispatchWorkItem { [weak self] in
        text.forEach { char in
          DispatchQueue.main.async {
            self?.kitchenLabel?.text?.append(char)
          }
          Thread.sleep(forTimeInterval: characterDelay/100)
        }
      }

      let queue: DispatchQueue = .init(label: "typespeed", qos: .userInteractive)
      queue.asyncAfter(deadline: .now() + 0.05, execute: writingTask)
    }
}
