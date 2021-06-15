//
//  IntroSecondViewController.swift
//  UnsafeVillage
//
//  Created by Victoria Faria on 14/06/21.
//

import UIKit

class IntroSecondViewController: UIViewController {

    @IBOutlet weak var introLabel2: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        setTyping(text: "Nesse momento Aya percebeu que algo estava muito errado e uma profunda sensacao pavor e preocupacao lhe apunhalou, se lembrou das outras 3 criancas desaparecidas recentemente sem nenhuma explicacao, e se desesperou, ligou para os pais e para todos que poderiam ter alguma noticia do garoto, mas como ja temia, ninguem sabia onde ele poderia estar. Nesse momento a busca incessante pelo seu irmao e iniciada")
    }
    
    func setTyping(text: String, characterDelay: TimeInterval = 5.0) {
      introLabel2.text = ""

      let writingTask = DispatchWorkItem { [weak self] in
        text.forEach { char in
          DispatchQueue.main.async {
            self?.introLabel2?.text?.append(char)
          }
          Thread.sleep(forTimeInterval: characterDelay/100)
        }
      }

      let queue: DispatchQueue = .init(label: "typespeed", qos: .userInteractive)
      queue.asyncAfter(deadline: .now() + 0.05, execute: writingTask)
    }
}
