//
//  CardSelectionVC.swift
//  CardWorkout
//
//  Created by Bruno Albino on 31/05/23.
//

import UIKit

class CardSelectionVC: UIViewController {
    @IBOutlet var cardImageView: UIImageView!
    var started = false
    var timer: Timer!
    var cards: [UIImage] = Card.allCards
    @IBOutlet var ctaButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
    
    func start() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(switchCard), userInfo: nil, repeats: true)
        started = true
        ctaButton.setTitle("Stop", for: .normal)
        ctaButton.backgroundColor = .systemRed
    }
    
    func stop() {
        timer.invalidate()
        started = false
        ctaButton.setTitle("Start", for: .normal)
        ctaButton.backgroundColor = .systemGreen
    }
    
    @objc func switchCard() {
        cardImageView.image = cards.randomElement()
    }

    
    @IBAction func ctaButtonTapped(_ sender: Any) {
        if !started {
            return start()
        }
        
        return stop()
    }
    
    @IBAction func rulesButtonTapped(_ sender: Any) {
        if started {
            return stop()
        }
    }
}
