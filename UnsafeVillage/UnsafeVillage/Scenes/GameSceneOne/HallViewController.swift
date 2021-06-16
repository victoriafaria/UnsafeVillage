//
//  HallViewController.swift
//  UnsafeVillage
//
//  Created by Victoria Faria on 14/06/21.
//

import UIKit

class HallViewController: UIViewController {

    @IBOutlet weak var hallLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    func setTyping(text: String, characterDelay: TimeInterval = 5.0) {
        hallLabel.text = ""

      let writingTask = DispatchWorkItem { [weak self] in
        text.forEach { char in
          DispatchQueue.main.async {
            self?.hallLabel?.text?.append(char)
          }
          Thread.sleep(forTimeInterval: characterDelay/100)
        }
      }

      let queue: DispatchQueue = .init(label: "typespeed", qos: .userInteractive)
      queue.asyncAfter(deadline: .now() + 0.05, execute: writingTask)
    }
}
