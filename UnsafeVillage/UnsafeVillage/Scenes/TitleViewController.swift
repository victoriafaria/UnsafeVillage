//
//  ViewController.swift
//  UnsafeVillage
//
//  Created by Victoria Faria on 13/06/21.
//

import UIKit
import SpriteKit

class TitleViewController: UIViewController{

    @IBOutlet weak var pressStartButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

//        backgroundSound()
    }

    func backgroundSound() {
        let sound = SKAudioNode(fileNamed: "background-terror")
        sound.removeFromParent()
        sound.autoplayLooped = false
        sound.addChild(sound)
        sound.run(SKAction.sequence([SKAction.wait(forDuration: 0.5),SKAction.run {
                                    sound.run(SKAction.play())}]))

    }


//    func blinkForever () {
//        let fadeIn = SKAction.fadeIn(withDuration: 0.5)
//        let fadeOut = SKAction.fadeOut(withDuration: 0.5)
//        let blink = SKAction.sequence([fadeIn,fadeOut])
//        let blinkForever = SKAction.repeatForever(blink)
//        pressStartButton.run(blinkForever)
//    }
}
