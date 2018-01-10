//
//  ViewController.swift
//  EasyConstraints
//
//  Created by Jordan Osterberg on 1/10/18.
//  Copyright © 2018 Jordan Osterberg. All rights reserved.
//

import UIKit

class ExampleViewController: UIViewController {

    let imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "testimg")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let redView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.red
        return view
    }()
    
    let blueView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.blue
        return view
    }()
    
    let greenView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.green
        return view
    }()
    
    let yellowView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.yellow
        return view
    }()
    
    let slider : UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.isContinuous = true
        slider.value = 0
        slider.tintColor = UIColor.red
        return slider
    }()
    
    let sliderLabel : UILabel = {
        let label = UILabel()
        label.text = "Distance: 0"
        return label
    }()
    
    let actionButton : UIButton = {
        let button = UIButton()
        button.setTitle("Enable automatic", for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        self.layoutViews()
    }
    
    private var redViewRightConstraint : NSLayoutConstraint!
    private var blueViewBelowConstraint : NSLayoutConstraint!
    private var greenViewAboveConstraint : NSLayoutConstraint!
    private var yellowViewAboveConstraint : NSLayoutConstraint!
    
    func layoutViews() {
        self.view.addSubview(self.imageView)
        
        self.imageView.centerVertically(in: self.view)
        self.imageView.centerHorizontally(in: self.view)
        self.imageView.setHeight(equalTo: 100)
        self.imageView.setWidth(equalTo: 100)
        
        self.view.addSubview(self.redView)
        
        self.redView.centerVertically(in: self.imageView)
        self.redView.setHeight(equalTo: 50)
        self.redView.setWidth(equalTo: 50)
        self.redViewRightConstraint = self.redView.placeRightOf(view: self.imageView)
        
        self.view.addSubview(self.blueView)
        
        self.blueView.setWidth(equalTo: 150)
        self.blueView.setHeight(equalTo: 50)
        self.blueView.centerHorizontally(in: self.imageView)
        self.blueViewBelowConstraint = self.blueView.placeBelow(view: self.imageView)
        
        self.view.addSubview(self.greenView)
        
        self.greenView.setWidth(equalTo: 25)
        self.greenView.setHeight(equalTo: 100)
        self.greenView.centerHorizontally(in: self.imageView)
        self.greenViewAboveConstraint = self.greenView.placeAbove(view: self.imageView)
        
        self.view.addSubview(self.yellowView)
        
        self.yellowView.setWidth(equalTo: 100)
        self.yellowView.setHeight(equalTo: 100)
        self.yellowView.centerHorizontally(in: self.greenView)
        self.yellowViewAboveConstraint = self.yellowView.placeAbove(view: self.greenView)
        
        self.view.addSubview(self.slider)
        
        self.slider.centerHorizontally(in: self.view)
        self.slider.placeBelow(view: self.view, distance: -125)
        self.slider.setWidth(equalTo: self.view.frame.width - 64)
        
        self.slider.addTarget(self, action: #selector(sliderValueDidChange), for: .valueChanged)
        
        self.view.addSubview(self.sliderLabel)
        
        self.sliderLabel.placeAbove(view: self.slider, distance: -10)
        self.sliderLabel.centerHorizontally(in: self.slider)
        
        self.view.addSubview(self.actionButton)
        
        self.actionButton.placeBelow(view: self.slider, distance: 10)
        self.actionButton.centerHorizontally(in: self.slider)
        
        self.actionButton.addTarget(self, action: #selector(actionButtonWasTapped), for: .touchUpInside)
    }

    @objc func sliderValueDidChange(sender: UISlider) {
        let value = CGFloat(sender.value)
        
        self.redViewRightConstraint.constant = value
        self.blueViewBelowConstraint.constant = value
        self.greenViewAboveConstraint.constant = -value
        self.yellowViewAboveConstraint.constant = -value
        
        self.view.layoutIfNeeded()
        
        self.sliderLabel.text = "Distance: \(Int(value))"
    }

    var isAutomaticEnabled = false
    var positiveDirection = true
    var timer : Timer? = nil
    
    @objc func actionButtonWasTapped() {
        isAutomaticEnabled = !isAutomaticEnabled
        
        if isAutomaticEnabled {
            self.actionButton.setTitle("Disable automatic", for: .normal)
        } else {
            self.actionButton.setTitle("Enable automatic", for: .normal)
        }
        
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
        }
    }
    
    @objc func timerFunction() {
        if self.isAutomaticEnabled {
            if self.positiveDirection {
                self.slider.setValue(self.slider.value + 1, animated: true)
                
                if self.slider.value == 100 {
                    self.positiveDirection = false
                }
            } else {
                self.slider.setValue(self.slider.value - 1, animated: true)
                
                if self.slider.value == 0 {
                    self.positiveDirection = true
                }
            }
            
            self.sliderValueDidChange(sender: self.slider)
        }
    }
    
}

