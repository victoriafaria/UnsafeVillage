//
//  IntroViewController.swift
//  UnsafeVillage
//
//  Created by Victoria Faria on 14/06/21.
//

import UIKit

class IntroViewController: UIViewController {

    @IBOutlet weak var introLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        setTyping(text: "No dia 27 de Julho, Aya chega em casa por volta das 16:00 muito animada, e chama por seu irmao para lhe dar um abraço apertado como era de costume, ao chama-lo, consegui ouvi-lo responder “Ja vou”, aguardou aproximadamente 2 minutos enquanto guardava as suas coisas, mas seu irmao nao apareceu, chamou novamente, mas dessa vez não obteve resposta, foi ao quarto do pequeno e bateu na porta, nada, bateu novamente com mais urgencia e tentou abri-la, sem sucesso, estava trancada, ficou em silencio para que pudesse se concentrar e tentar ouvir algo do quarto, escutou um baixo suspiro assustado e nesse momento a porta ficou leve e se abriu, a garota olhou para todos os cantos do quarto e chamou mais algumas vezes o nome do irmao, mas nao tinha mais ninguem la, as janelas e as cortinas estavam fechadas, o que era estranho pois ainda era cedo, o quarto estava como sempre, e a cama um pouco bagungada o que indicava que Liam esteve sentado a alguns instantes atras.")
    }


    func setTyping(text: String, characterDelay: TimeInterval = 5.0) {
      introLabel.text = ""

      let writingTask = DispatchWorkItem { [weak self] in
        text.forEach { char in
          DispatchQueue.main.async {
            self?.introLabel?.text?.append(char)
          }
          Thread.sleep(forTimeInterval: characterDelay/100)
        }
      }

      let queue: DispatchQueue = .init(label: "typespeed", qos: .userInteractive)
      queue.asyncAfter(deadline: .now() + 0.05, execute: writingTask)
    }
}
