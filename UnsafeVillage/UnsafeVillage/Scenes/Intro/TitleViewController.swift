//
//  ViewController.swift
//  UnsafeVillage
//
//  Created by Victoria Faria on 13/06/21.
//

import UIKit
import AVFoundation
import SpriteKit

class TitleViewController: UIViewController{

    @IBOutlet weak var pressStartButton: UIButton!

    var gameBackgroundMusic = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        playSound()
    }

    func playSound() {
        let AssortedMusics = NSURL(fileURLWithPath: Bundle.main.path(forResource: "music-background", ofType: "mp3")!)
        gameBackgroundMusic = try! AVAudioPlayer(contentsOf: AssortedMusics as URL)
        gameBackgroundMusic.prepareToPlay()
        gameBackgroundMusic.numberOfLoops = -1
        gameBackgroundMusic.play()
    }
}
