//
//  ViewController.swift
//  animationslabtwo
//
//  Created by Ahad Islam on 2/19/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var linearButton: UIButton = {
        let button = UIButton()
        button.setTitle("Linear", for: .normal)
        return button
    }()
    
    private lazy var easeInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Easein", for: .normal)
        return button
    }()
    
    private lazy var easeOutButton: UIButton = {
        let button = UIButton()
        button.setTitle("Easeout", for: .normal)
        return button
    }()
    
    private lazy var easeInEaseOutButton: UIButton = {
        let button = UIButton()
        button.setTitle("Easeineaseout", for: .normal)
        return button
    }()
    
    private lazy var resetButton: UIButton = {
        let button = UIButton()
        button.setTitle("Reset", for: .normal)
        return button
    }()
    
    private lazy var animateButton: UIButton = {
        let button = UIButton()
        button.setTitle("Animate", for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
        setupResetButton()
        setupAnimateButton()
        view.backgroundColor = .systemBackground
        // Do any additional setup after loading the view.
    }
    
    private func setupButtons() {
        var buttons: [UIButton] = [linearButton, easeInButton, easeOutButton, easeInEaseOutButton]
        let stackView = UIStackView(arrangedSubviews: buttons)
        buttons += [resetButton, animateButton]
        buttons.forEach({ $0.setTitleColor(.systemBlue, for: .normal)})
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 5
        
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            stackView.heightAnchor.constraint(equalToConstant: 120)])
    }
    
    private func setupResetButton() {
        view.addSubview(resetButton)
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            resetButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            resetButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12)])
    }
    
    private func setupAnimateButton() {
        view.addSubview(animateButton)
        animateButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            animateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            animateButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12)])
    }


}

