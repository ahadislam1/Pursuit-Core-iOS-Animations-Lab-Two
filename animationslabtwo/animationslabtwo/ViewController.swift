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
        button.tag = 0
        button.setTitle("Linear", for: .normal)
        return button
    }()
    
    private lazy var easeInButton: UIButton = {
        let button = UIButton()
        button.tag = 1
        button.setTitle("Easein", for: .normal)
        return button
    }()
    
    private lazy var easeOutButton: UIButton = {
        let button = UIButton()
        button.tag = 2
        button.setTitle("Easeout", for: .normal)
        return button
    }()
    
    private lazy var easeInEaseOutButton: UIButton = {
        let button = UIButton()
        button.tag = 3
        button.setTitle("Easeineaseout", for: .normal)
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        return stackView
    }()
    
    private lazy var resetButton: UIButton = {
        let button = UIButton()
        button.setTitle("Reset", for: .normal)
        button.addTarget(self, action: #selector(resetImages), for: .touchUpInside)
        return button
    }()
    
    private lazy var animateButton: UIButton = {
        let button = UIButton()
        button.setTitle("Animate", for: .normal)
        button.addTarget(self, action: #selector(animateImages), for: .touchUpInside)
        return button
    }()
    
    private lazy var imageView: UIImageView = {
        let iv = UIImageView()
        return iv
    }()
    
    private lazy var secondImageView: UIImageView = {
        let iv = UIImageView()
        return iv
    }()
    
    private lazy var thirdImageView: UIImageView = {
        let iv = UIImageView()
        return iv
    }()
    
    private lazy var fourthImageView: UIImageView = {
        let iv = UIImageView()
        return iv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
        setupResetButton()
        setupAnimateButton()
        setupImages()
        print(view.frame.height / 2)
        view.backgroundColor = .systemBackground
    }
    
    @objc private func buttonPressed(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            imageView.isHidden.toggle()
        case 1:
            secondImageView.isHidden.toggle()
        case 2:
            thirdImageView.isHidden.toggle()
        case 3:
            fourthImageView.isHidden.toggle()
        default:
            break
        }
    }
    
    @objc private func animateImages() {
        animateView(imageView, option: .curveLinear)
        animateView(secondImageView, option: .curveEaseIn)
        animateView(thirdImageView, option: .curveEaseOut)
        animateView(fourthImageView, option: .curveEaseInOut)
    }
    
    @objc private func resetImages() {
        let images = [imageView, secondImageView, thirdImageView, fourthImageView]
        images.forEach({$0.transform = CGAffineTransform(translationX: 0, y: 0)})
    }
    
    
    private func animateView(_ imageView: UIImageView, option: UIView.AnimationOptions) {
        UIView.animate(withDuration: 3, delay: 0, options: [option], animations: {
            imageView.transform = CGAffineTransform(translationX: 0, y: self.view.frame.height / 2)
        }, completion: nil)
    }
    
    private func setupButtons() {
        var buttons: [UIButton] = [linearButton, easeInButton, easeOutButton, easeInEaseOutButton]
        buttons.forEach({
            stackView.addArrangedSubview($0)
            $0.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        })
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
    
    private func setupImages() {
        let images = [imageView, secondImageView, thirdImageView, fourthImageView]
        images.forEach({
            $0.contentMode = .scaleToFill
            $0.image = UIImage(systemName: "rosette")
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: stackView.bottomAnchor).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 120).isActive = true
            $0.widthAnchor.constraint(equalToConstant: view.frame.width/4).isActive = true
        })
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            secondImageView.leadingAnchor.constraint(equalTo: imageView.trailingAnchor),
            thirdImageView.leadingAnchor.constraint(equalTo: secondImageView.trailingAnchor),
            fourthImageView.leadingAnchor.constraint(equalTo: thirdImageView.trailingAnchor)])
    }
    
    
    
    
    
}

