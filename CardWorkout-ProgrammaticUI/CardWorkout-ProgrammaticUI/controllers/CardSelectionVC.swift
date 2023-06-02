//
//  CardSelectionVC.swift
//  CardWorkout-ProgrammaticUI
//
//  Created by Bruno Albino on 01/06/23.
//

import UIKit

class CardSelectionVC: UIViewController {
    let cards = Card.allCards
    let cardImageView = UIImageView()
    let ctaButton = CWButton(color: .systemGreen, title: "Start")
    let rulesButton = CWButton(color: .systemBlue, title: "Rules")
    var timer: Timer?
    var started = false

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        configureUI()
    }
    
    func configureUI() {
        configureCardImageView()
        configureCtaButton()
        configureRulesButton()
    }
    
    func configureCardImageView() {
        view.addSubview(cardImageView)
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        cardImageView.image = cards[0]
        
        NSLayoutConstraint.activate([
            cardImageView.widthAnchor.constraint(equalToConstant: 250),
            cardImageView.heightAnchor.constraint(equalToConstant: 350),
            cardImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -75)
        ])
    }
    
    func configureCtaButton() {
        view.addSubview(ctaButton)
        ctaButton.addTarget(self, action: #selector(ctaButtonTapped), for: .touchUpInside)
        ctaButton.setImage(image: UIImage(systemName: "play")!)
        
        NSLayoutConstraint.activate([
            ctaButton.widthAnchor.constraint(equalToConstant: 250),
            ctaButton.heightAnchor.constraint(equalToConstant: 50),
            ctaButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ctaButton.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 50)
        ])
        
    }
    
    func configureRulesButton() {
        view.addSubview(rulesButton)
        rulesButton.addTarget(self, action: #selector(presentRulesVC), for: .touchUpInside)
        
        rulesButton.setImage(image: UIImage(systemName: "list.bullet")!)
        
        NSLayoutConstraint.activate([
            rulesButton.widthAnchor.constraint(equalToConstant: 250),
            rulesButton.heightAnchor.constraint(equalToConstant: 50),
            rulesButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rulesButton.topAnchor.constraint(equalTo: ctaButton.bottomAnchor, constant: 20)
        ])
    }
    
    @objc func ctaButtonTapped() {
        if started {
           return stop()
        }
        
        return start()
    }
    
    func start() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(switchCard), userInfo: nil, repeats: true)
        started = true
        
        ctaButton.setTitle(title: "Stop")
        ctaButton.setColor(color: .systemRed)
        ctaButton.setImage(image: UIImage(systemName: "stop.circle")!)
    }
    
    func stop() {
        timer?.invalidate()
        started = false
        
        ctaButton.setTitle(title: "Start")
        ctaButton.setColor(color: .systemGreen)
        ctaButton.setImage(image: UIImage(systemName: "play")!)
    }
    
    @objc func switchCard() {
        cardImageView.image = cards.randomElement()
    }
    
    @objc func presentRulesVC() {
        present(RulesVC(), animated: true)
    }
}
