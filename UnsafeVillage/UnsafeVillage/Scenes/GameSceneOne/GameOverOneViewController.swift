//
//  GameOverOneViewController.swift
//  UnsafeVillage
//
//  Created by Victoria Faria on 16/06/21.
//

import UIKit
import AVFoundation

class GameOverOneViewController: UIViewController {

    @IBOutlet weak var openButton: UIButton!
    @IBOutlet weak var slenderButton: UIButton!

    var gameBackgroundMusic = AVAudioPlayer()

    @IBAction func button(sender: UIButton){
        slenderButton.isHidden = false
        playSoundButton()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func playSoundButton() {
        let AssortedMusics = NSURL(fileURLWithPath: Bundle.main.path(forResource: "scream-3", ofType: "mp3")!)
        gameBackgroundMusic = try! AVAudioPlayer(contentsOf: AssortedMusics as URL)
        gameBackgroundMusic.prepareToPlay()
        gameBackgroundMusic.numberOfLoops = 0
        gameBackgroundMusic.play()
    }
}
